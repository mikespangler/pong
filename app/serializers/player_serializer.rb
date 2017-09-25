class PlayerSerializer < ActiveModel::Serializer
    attributes :id, :name, :games_played_count, :win_percentage, :games_since_last_play
end
