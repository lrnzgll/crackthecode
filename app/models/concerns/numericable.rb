# frozen_string_literal: true

module Numericable
  extend ActiveSupport::Concern

  NUMBERS = %w[0 1 2 3 4 5 6 7 8 9].freeze
  PATTERN_SIZE = 5
  POSSIBLE_PATTERNS = NUMBERS.permutation(PATTERN_SIZE).map(&:join)

  included do
    validates :number, length: { minimum: PATTERN_SIZE, maximum: PATTERN_SIZE, message: "should have #{PATTERN_SIZE} digits", allow_blank: true }
    validates :number, format: { with: /\A\d+\z/, allow_blank: true, message: "should include only digits." }
    validates :number, presence: true, inclusion: { in: POSSIBLE_PATTERNS, allow_blank: true, message: "shouldn't include any duplicate digit", allow_blank: true }, if: ->(number) { number.errors.none? }
  end

  def number_as_digits
    number.chars
  end

  def random_number
    POSSIBLE_PATTERNS.sample
  end
end
