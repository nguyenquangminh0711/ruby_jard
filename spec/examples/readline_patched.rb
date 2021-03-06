# frozen_string_literal: true

require 'reline'
require 'ruby_jard'

if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.5')
  Readline = Reline
else
  # Faking using another implementation
  module Readline
    def self.input=(value)
      super
    end
  end
end

class Calculator
  def calculate(a, b, c)
    jard
    d = a + b
    jard
    e = d + 10
    jard
    e + c
  end
end

Calculator.new.calculate(1, 2, 3)
