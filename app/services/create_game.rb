# frozen_string_literal: true

class CreateGame < ApplicationService
  map :new_game
  map :add_number
  try :save!, catch: ActiveRecord::RecordInvalid

  def new_game
    Game.new
  end

  def add_number(game)
    game.number = game.random_number
    game
  end

  def save!(game)
    game.save!
    game
  end
end
