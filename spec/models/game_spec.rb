require 'rails_helper'

RSpec.describe Game, type: :model do

    let(:player_1) { FactoryGirl.create :player, name: 'Rick' }
    let(:player_2) { FactoryGirl.create :player, name: 'Morty' }
    let(:game) { FactoryGirl.create :game, player_1: player_1, player_2: player_2 }

    describe "#scoreboard" do
        before do
            3.times { game.scores.create!(player: player_1) }
            2.times { game.scores.create!(player: player_2) }
        end
        it 'displays the score' do
            expect(game.scoreboard).to include('Rick' => 3, 'Morty' => 2)
        end
    end

    describe "#rewind" do
        before do
            3.times { game.scores.create!(player: player_1) }
            2.times { game.scores.create!(player: player_2) }
        end
        it 'removes the last point scored' do
            expect { game.rewind! }.to change(game.scores, :count).by(-1)
        end
    end
end
