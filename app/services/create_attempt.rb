# frozen_string_literal: true

class CreateAttempt < ApplicationService
  try :game, catch: ActiveRecord::RecordNotFound
  try :create!, catch: ActiveRecord::RecordInvalid
  map :result

  def game(game_id:, attempt:)
    game = Game.find(game_id)

    { game:, attempt: }
  end

  def create!(game:, attempt:)
    game.attempts.create!(attempt)
  end

  def result(attempt)
    AttemptResult.call(attempt:)
  end
end
