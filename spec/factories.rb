# This will guess the User class
FactoryGirl.define do
  factory :player do
    name "John"
  end  

  factory :game do
    association :player_1,  factory: :player
    association :player_2,  factory: :player
    finished false
    created_at Time.now
    updated_at Time.now
  end

  factory :score do
    association :player
    association :game
    created_at Time.now
    updated_at Time.now
  end
end
