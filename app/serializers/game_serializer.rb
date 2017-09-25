class GameSerializer < ActiveModel::Serializer
    attributes :id, :scoreboard, :serving, :finished, :game_winner

    def game_winner
        winner.nil? ? "Game not finished." : names_index[winner]
    end

    def winner
        object.winner
    end

    def service
        object.service
    end

    def serving
        names_index[object.service]  
    end

    def player_1
        object.player_1
    end
    
    def player_2
        object.player_2
    end

    def names_index
        {
            player_1.id => player_1.name,
            player_2.id => player_2.name
        }
    end
end
