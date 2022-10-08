# frozen_string_literal: true

class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @attempts = @game.attempts.load
  end

  def new; end

  def create
    @game = Game.new(create_params)

    if @game.save
      redirect_to game_path(@game)
    else
      flash[:error] = "Big Error"
    end
  end

  def create_params
    params.require(:game).permit(:number)
  end
end
