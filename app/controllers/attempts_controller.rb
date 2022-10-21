# frozen_string_literal: true

class AttemptsController < ApplicationController
  before_action :find_game, only: [:create]

  def create
    attempt = @game.attempts.new(permitted_params[:attempt])

    if attempt.save
      respond_to do |format|
        if @game.ended?
          format.turbo_stream { render turbo_stream: turbo_stream.replace('attempt_form', partial: 'games/ended') }
        else
          @attempt = @game.attempts.new
          format.turbo_stream { render turbo_stream: turbo_stream.replace('attempt_form', partial: 'games/attempt_form') }
        end
      end
    else
      respond_to do |format|
        @attempt = attempt
        format.turbo_stream { render turbo_stream: turbo_stream.replace('attempt_form', partial: 'games/attempt_form') }
      end
    end
  end

  private

  def permitted_params
    params.permit(:game_id, attempt: [:number])
  end

  def find_game
    @game = Game.find(permitted_params[:game_id])
  end
end
