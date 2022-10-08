# frozen_string_literal: true

class AttemptsController < ApplicationController
  def create
    CreateAttempt.new.call(game_id: attempt_params[:game_id], attempt: attempt_params[:attempt]) do |on|
      on.success do
        redirect_to game_path(attempt_params[:game_id])
      end

      on.failure do
        flash[:error] = 'Something went wrong!'
        redirect_to root_path
      end
    end
  end

  private

  def attempt_params
    params.permit(:game_id, attempt: [:number])
  end
end
