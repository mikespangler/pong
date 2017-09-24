class GameSerializer < ActiveModel::Serializer
    attributes :id, :scoreboard, :service, :finished, :winner

    def winner
        object.winner.nil? ? "Game not finished." : object.winner
    end

    # def service
    #     self.names_index[self.service]
    # end

end
