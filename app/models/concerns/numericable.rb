# frozen_string_literal: true

module Numericable
  extend ActiveSupport::Concern

  NUMBERS = %w[0 1 2 3 4 5 6 7 8 9].freeze
  PATTERN_SIZE = 5
  POSSIBLE_PATTERNS = NUMBERS.permutation(PATTERN_SIZE).map(&:join)

  included do
    validates :number, presence: true, numericality: { only_integer: true }
    validates :number, comparison: { greater_than: 0, less_than_or_equal_to: 99_999 }
  end

  def number_as_digits
    number.to_s.chars.map(&:to_i)
  end

  def random_number
    POSSIBLE_PATTERNS.sample
  end
end
