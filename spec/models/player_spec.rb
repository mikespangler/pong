require 'rails_helper'
require 'date'

RSpec.describe Player, :type => :model do
    let(:rick) { FactoryGirl.create :player, name: 'Rick' }
    let(:morty) { FactoryGirl.create :player, name: 'Morty' }
    let(:steve) { FactoryGirl.create :player, name: 'Steve' }

    let(:game) { FactoryGirl.create :game, player_1: rick, player_2: morty }

    describe "#win_percentage" do
        before do
            5.times { FactoryGirl.create :game, player_1: rick, player_2: morty }
            5.times { FactoryGirl.create :game, player_1: rick, player_2: morty, winner: rick.id }
        end
        it 'returns the correct win percentage' do
            expect(player_1.win_percentage).to eq(50)
        end
    end

    describe "#games_since_last_play" do
        before do
            Game.destroy_all
            FactoryGirl.create :game, player_1: rick, player_2: morty, finished: true, updated_at: DateTime.now
            3.times { FactoryGirl.create :game, player_1: rick, player_2: steve, finished: true, created_at: DateTime.now + 1 }
        end
        it 'returns the number of games played since the given players last game' do
            expect(morty.games_since_last_play).to eq(3)
        end
    end
end
