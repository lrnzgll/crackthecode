# frozen_string_literal: true

module Numericable
  extend ActiveSupport::Concern

  included do
    validates :number, presence: true, numericality: { only_integer: true }
    validates :number, comparison: { greater_than: 0, less_than_or_equal_to: 99_999 }
  end

  def number_as_digits
    number.to_s.chars.map(&:to_i)
  end
end
