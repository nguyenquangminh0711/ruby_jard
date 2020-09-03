# frozen_string_literal: true

module RubyJard
  ##
  # Centralized flow control and data storage to feed into screens. Each
  # process supposes to have only one instance of this class.
  # TODO: This class is created to store data, but byebug data structures are
  # leaked, and accessible from outside and this doesn't work if screens stay in
  # other processes. Therefore, an internal, jard-specific data mapping should
  # be built.
  class Session
    class << self
      extend Forwardable

      def_delegators :instance,
                     :attach, :lock,
                     :assume_context, :sync, :should_stop?,
                     :step_over, :step_into, :frame=,
                     :threads, :current_frame, :current_thread, :current_backtrace,
                     :output_buffer, :append_output_buffer

      def instance
        @instance ||= new
      end
    end

    OUTPUT_BUFFER_LENGTH = 10_000 # 10k lines

    attr_accessor :threads, :current_frame, :current_thread, :current_backtrace, :output_buffer

    def initialize(options = {})
      @options = options
      @started = false
      @session_lock = Mutex.new
      @output_buffer = []

      @current_frame = nil
      @current_backtrace = []
      @threads = []

      @path_filter = RubyJard::PathFilter.new
    end

    def start
      return if started?

      ##
      # Globally configure Byebug. Byebug doesn't allow configuration by instance.
      # So, I have no choice.
      # TODO: Byebug autoloaded configuration may override those values.
      Byebug::Setting[:autolist] = false
      Byebug::Setting[:autoirb] = false
      Byebug::Setting[:autopry] = false
      Byebug::Context.processor = RubyJard::ReplProcessor
      # Exclude all files in Ruby Jard source code from the stacktrace.
      Byebug::Context.ignored_files = Byebug::Context.all_files + Dir.glob(
        File.join(
          File.expand_path(__dir__, '../lib'),
          '**',
          '*.rb'
        )
      )
      # rubocop:disable Lint/NestedMethodDefinition
      def $stdout.write(*string, from_jard: false)
        # NOTE: `RubyJard::ScreenManager.instance` is a must. Jard doesn't work well with delegator
        # TODO: Debug and fix the issues permanently
        if from_jard
          super(*string)
          return
        end

        unless RubyJard::ScreenManager.instance.updating?
          RubyJard::Session.instance.append_output_buffer(string)
        end

        super(*string)
      end
      # rubocop:enable Lint/NestedMethodDefinition

      at_exit { stop }

      @started = true
    end

    def append_output_buffer(string)
      @output_buffer.shift if @output_buffer.length > OUTPUT_BUFFER_LENGTH
      @output_buffer << string
    end

    def stop
      return unless started?

      RubyJard::ScreenManager.stop
    end

    def started?
      @started == true
    end

    def attach
      start unless started?

      Byebug.attach
      Byebug.current_context.step_out(3, true)
    end

    def assume_context
      @current_context = Byebug.current_context
    end

    def should_stop?
      @path_filter.match?(@current_context.frame_file)
    end

    def sync
      @current_frame = RubyJard::Frame.new(@current_context, @current_context.frame.pos)
      @current_thread = RubyJard::ThreadInfo.new(@current_context.thread)
      @current_backtrace = @current_context.backtrace.map.with_index do |_frame, index|
        RubyJard::Frame.new(@current_context, index)
      end
      threads =
        Thread
        .list
        .select(&:alive?)
        .reject { |t| t.name.to_s =~ /<<Jard:.*>>/ }
        .map { |t| RubyJard::ThreadInfo.new(t) }
      @threads = threads.each_with_object({}) { |t, hash| hash[t.id] = t }
    end

    def frame=(next_frame)
      @current_context.frame = next_frame
    end

    def step_into(times)
      @current_context.step_into(times, RubyJard::Session.current_frame.pos)
    end

    def step_over(times)
      @current_context.step_over(times, RubyJard::Session.current_frame.pos)
    end

    def lock
      raise RubyJard::Error, 'This method requires a block' unless block_given?

      # TODO: This doesn't solve anything. However, debugging a multi-threaded process is hard.
      # Let's deal with that later.
      @session_lock.synchronize do
        yield
      end
    end
  end
end
