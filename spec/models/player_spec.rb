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
            expect(rick.win_percentage).to eq(50)
        end
    end

    describe "#games_since_last_play" do
        before do
            FactoryGirl.create :game, player_1: rick, player_2: morty, finished: true, updated_at: DateTime.now
            3.times { FactoryGirl.create :game, player_1: rick, player_2: steve, finished: true, created_at: DateTime.now }
        end
        it 'returns the number of games played since the given players last game' do
            expect(morty.games_since_last_play).to eq(3)
            FactoryGirl.create :game, player_1: rick, player_2: morty, finished: true, updated_at: DateTime.now
            expect(morty.games_since_last_play).to eq(0)
        end
    end

    describe "#win_percentage_vs" do
        before do 
            6.times { FactoryGirl.create :game, player_1: rick, player_2: morty, winner: rick.id, finished: true }
            2.times { FactoryGirl.create :game, player_1: rick, player_2: morty, winner: morty.id, finished: true }
        end
        it "returns the correct percentage of wins vs a given player" do 
            expect(rick.win_percentage_vs(morty)).to eq(75)
        end
    end    
    describe "#avg_total_points_vs" do
        let(:game1) { FactoryGirl.create :game, player_1: rick, player_2: morty }
        let(:game2) { FactoryGirl.create :game, player_1: rick, player_2: morty }
        before do
            10.times { FactoryGirl.create :score, player: rick, game: game1}
            21.times { FactoryGirl.create :score, player: morty, game: game1}

            19.times { FactoryGirl.create :score, player: morty, game: game2}
            10.times { FactoryGirl.create :score, player: rick, game: game2}
        end
        it "returns the avg total points of wins in games between the two given players" do 
            expect(rick.avg_total_points_vs(morty)).to eq(30)
        end
    end    
    describe "#total_games_vs" do
        before do 
            3.times { FactoryGirl.create :game, player_1: rick, player_2: morty}
            1.times { FactoryGirl.create :game, player_1: rick, player_2: steve}
        end
        it "returns the correct number of total games vs given player" do 
            expect(rick.total_games_vs(morty)).to eq(3)
        end
    end
end
