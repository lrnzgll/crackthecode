# frozen_string_literal: true

class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @attempts = Attempt.where(game: @game)
    @attempt = @game.attempts.new
  end

  def new; end

  def create
    CreateGame.new.call do |on|
      on.success do |game|
        redirect_to game_path(game)
      end

      on.failure do
        flash[:error] = "Big Error"
      end
    end
  end

  def create_params
    params.require(:game).permit(:number)
  end
end
