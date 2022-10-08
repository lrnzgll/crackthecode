# frozen_string_literal: true

class Game < ApplicationRecord
  include Numericable

  has_many :attempts, dependent: :destroy
end
