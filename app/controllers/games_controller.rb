class GamesController < ApplicationController
  def show

  end

  def create
    @game = Game.create!

    redirect_to game_path(@game)
  end
end
