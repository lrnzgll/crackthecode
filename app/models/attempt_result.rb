# frozen_string_literal: true

class AttemptResult
  def self.call(attempt:)
    new(attempt:).call
  end

  def initialize(attempt:)
    @attempt = attempt
    @bulls = 0
    @cows = 0
  end

  def call
    @attempt.game.number_as_digits.each_with_index do |c, index|
      if @attempt.number_as_digits[index] == c
        @bulls += 1
      elsif @attempt.number_as_digits.include?(c)
        @cows += 1
      end
    end

    {
      bulls: @bulls,
      cows: @cows
    }
  end
end
