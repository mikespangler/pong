require 'rails_helper'

RSpec.describe "Scores", type: :request do
  describe "POST /scores" do
    let(:player_1) { FactoryGirl.create :player, name: 'Rick' }
    let(:player_2) { FactoryGirl.create :player, name: 'Morty' }
    let(:game) { FactoryGirl.create :game, player_1: player_1, player_2: player_2 }
    let(:score_1) { FactoryGirl.create :score, player: player_1 }
    let(:score_2) { FactoryGirl.create :score, player: player_2 }
    let(:score_3) { FactoryGirl.create :score, player: player_2 }
    let(:score_4) { FactoryGirl.create :score, player: player_1 }
    let(:score_5) { FactoryGirl.create :score, player: player_2 }
    it "creates scores" do
      get scores_path
      expect(response).to have_http_status(200)
    end
  end
end
