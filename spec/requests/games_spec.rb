require 'rails_helper'

RSpec.describe "Games", type: :request do

    describe 'game#create' do
        let(:player_1) { FactoryGirl.create :player, name: 'Rick' }
        let(:player_2) { FactoryGirl.create :player, name: 'Morty' }
        let(:service) { 2 }
        it "creates a game with two players" do
            post "/game", :params => { "player_1_id": player_1.id, "player_2_id": player_2.id, "service": service }
            expect(response.status).to be(201)
        end
        it 'sets the service of the game' do
            expect(Game.last.service).to eq(1)
        end
    end

    describe 'game#show' do
        let(:game) { FactoryGirl.create :game }
        it "returns data for a given game" do
            get "/game/#{game.id}"
            expect(JSON.parse(response.body).keys).to include('scoreboard', 'finished', 'winner')
        end
    end
end
