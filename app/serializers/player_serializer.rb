class PlayerSerializer < ActiveModel::Serializer
    attributes :id, :name, :games_played, :win_percentage, :games_since_last_play
end
