class GameSerializer < ActiveModel::Serializer
    attributes :id, :scoreboard, :serving, :finished
end
