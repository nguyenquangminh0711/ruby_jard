# frozen_string_literal: true

module RubyJard
  module Inspectors
    ##
    # Decorate Array data structure, supports inline and multiline form.
    class ArrayInpsector
      include NestedHelper

      def initialize(base)
        @base = base
      end

      def match?(variable)
        RubyJard::Reflection.call_is_a?(variable, Array)
      end

      def inline(variable, line_limit:, depth: 0)
        SimpleRow.new(
          RubyJard::Span.new(content: '[', styles: :text_primary),
          inline_values(
            variable.each_with_index, total: variable.length, line_limit: line_limit - 2, depth: depth + 1
          ),
          RubyJard::Span.new(content: ']', styles: :text_primary)
        )
      end

      def multiline(variable, first_line_limit:, lines:, line_limit:, depth: 0)
        if variable.length <= 1
          return [inline(variable, line_limit: first_line_limit, depth: depth)]
        elsif variable.length > lines * 2 || !same_type?(variable, lines)
          return do_multiline(variable, lines: lines, line_limit: line_limit, depth: depth)
        end

        inline = inline(variable, line_limit: first_line_limit, depth: depth)
        if inline.content_length < line_limit
          [inline]
        else
          do_multiline(variable, lines: lines, line_limit: line_limit, depth: depth)
        end
      end

      private

      def same_type?(variable, sample)
        variable.first(sample).map { |item| RubyJard::Reflection.call_class(item) }.uniq.length <= 1
      end

      def do_multiline(variable, lines:, line_limit:, depth: 0)
        columns = [SimpleRow.new(RubyJard::Span.new(content: '[', styles: :text_primary))]

        item_count = 0
        variable.each_with_index do |value, index|
          columns << multiline_value(value, line_limit: line_limit, depth: depth + 1)

          item_count += 1
          break if index >= lines - 2
        end

        columns << last_line(variable.length, item_count)
      end

      def last_line(total, item_count)
        if total > item_count
          SimpleRow.new(
            RubyJard::Span.new(
              content: "▸ #{total - item_count} more...",
              margin_left: 2, styles: :text_dim
            ),
            RubyJard::Span.new(
              content: ']',
              styles: :text_primary
            )
          )
        else
          SimpleRow.new(RubyJard::Span.new(content: ']', styles: :text_primary))
        end
      end
    end
  end
end
