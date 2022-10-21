# frozen_string_literal: true

class Attempt < ApplicationRecord
  include Numericable
  after_create_commit { broadcast_append_to "attempts" }

  belongs_to :game
end
