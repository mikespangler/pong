class Player < ApplicationRecord
    validates_presence_of :name
    has_many :scores
    
    def games
        Game.where("player_1_id = ? OR player_2_id = ?", self.id, self.id)
    end    

    def games_vs_player(opposing_player)
        self.games.where("player_1_id = ? OR player_2_id = ?", opposing_player.id, opposing_player.id)
    end

    def games_played_count
        self.games.count
    end

    def win_percentage
        games_played_count > 0 ? (self.games.where(:winner => self.id).count.to_f / games_played_count.to_f) * 100 : 0
    end

    def games_since_last_play
        if games_played_count > 0
            Game.where(finished: true).where('created_at > ?', self.games.last.updated_at).count
        else
            'Player has not yet played a game.'
        end
    end

    # I would much rather have this in a serializer, but it's very tough to find documentation on ActiveModel::Serializers
    def history(opposing_player)
        {
            "win_percentage": self.win_percentage_vs(opposing_player),
            "avg_total_points": self.avg_total_points_vs(opposing_player),
            "total_games": self.total_games_vs(opposing_player)
        }
    end

    def win_percentage_vs(opposing_player)
        if games_vs_player(opposing_player).count > 0
            games_won_vs_player = self.games_vs_player(opposing_player).where(finished: true, winner: self.id).count
            (games_won_vs_player.to_f /  games_vs_player(opposing_player).count.to_f) * 100
        else
            'These players have not played against each other.'
        end
    end

    def avg_total_points_vs(opposing_player)
        if games_vs_player(opposing_player).count > 0
            game_totals = self.games_vs_player(opposing_player).joins(:scores).group('games.id').count
            game_totals.values.sum.to_f / game_totals.length.to_f
        else
            'These players have not played against each other.'
        end
    end

    def total_games_vs(opposing_player)
        self.games_vs_player(opposing_player).count
    end
end
