require 'date'

FactoryGirl.define do
  factory :player do
    name "John"
  end  

  factory :game do
    association :player_1,  factory: :player
    association :player_2,  factory: :player
    finished false
    created_at DateTime.now
    updated_at DateTime.now
  end

  factory :score do
    association :player
    association :game
    created_at DateTime.now
    updated_at DateTime.now
  end
end
