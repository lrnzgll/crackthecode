# frozen_string_literal: true

class Game < ApplicationRecord
  include Numericable

  has_many :attempts, dependent: :destroy

  def ended?
    attempts
      .pluck(:number)
      .any? { |num| num == number }
  end
end
