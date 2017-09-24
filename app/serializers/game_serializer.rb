class GameSerializer < ActiveModel::Serializer
    attributes :id, :scoreboard, :serving, :finished, :winner_name
end
