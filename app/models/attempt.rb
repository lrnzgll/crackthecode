# frozen_string_literal: true

class Attempt < ApplicationRecord
  include Numericable

  belongs_to :game
end
