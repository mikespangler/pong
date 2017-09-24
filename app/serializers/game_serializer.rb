class GameSerializer < ActiveModel::Serializer
    attributes :id, :scoreboard, :service, :finished?
end
