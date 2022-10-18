# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#ended?' do
    let(:game) { create(:game, number: 12_345) }
    let!(:incorrect_attempt) { create(:attempt, number: 54_321, game:) }

    it { expect(game.ended?).to be_falsy }

    context 'is ended if the correct number has been guessed' do
      let!(:correct_attempt) { create(:attempt, number: 12_345, game:) }
      it { expect(game.ended?).to be_truthy }
    end
  end
end
