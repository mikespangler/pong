require 'rails_helper'

RSpec.describe Player, :type => :model do
  it "orders by last name" do
    rick = Player.create!(name: "Rick")
    morty = Player.create!(name: "Morty")

    expect(Player).to eq([chelimsky, lindeman])
  end
end
