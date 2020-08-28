# frozen_string_literal: true

module RubyJard
  class StringDecorator
    def initialize(general_decorator)
      @general_decorator = general_decorator
    end

    def match?(variable)
      variable.is_a?(String)
    end

    # rubocop:disable Lint/UnusedMethodArgument
    def decorate_multiline(variable, first_line_limit:, line_limit:, lines:)
      [
        decorate_singleline(variable, line_limit: first_line_limit)
      ]
    end
    # rubocop:enable Lint/UnusedMethodArgument

    def decorate_singleline(variable, line_limit:)
      inspection = variable.inspect[1..-1].chomp!('"')
      str =
        if inspection.length < line_limit - 2
          inspection
        else
          inspection[0..line_limit - 5] + ' »'
        end
      [

        RubyJard::Span.new(content: '"', styles: :string),
        RubyJard::Span.new(content: str, styles: :string),
        RubyJard::Span.new(content: '"', styles: :string)
      ]
    end
  end
end