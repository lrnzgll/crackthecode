# frozen_string_literal: true

class AttemptComponent < ViewComponent::Base
  def initialize(number:, result:)
    @number = number
    @bulls = result[:bulls]
    @cows = result[:cows]
  end
end
