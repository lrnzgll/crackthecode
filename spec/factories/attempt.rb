# frozen_string_literal: true

FactoryBot.define do
  factory :attempt do
    number { 12_345 }
    game
  end
end
