class Player < ApplicationRecord
    validates_presence_of :name
    has_many :scores
    
    def games
        Game.where("player_1_id = ? OR player_2_id = ?", self.id, self.id)
    end

    def games_played
        self.games.count
    end

    def win_percentage
        games_played > 0 ? (self.games.where(:winner => self.id).count.to_f / games_played.to_f) * 100 : 0
    end

    def games_since_last_play
        if games_played > 0
            Game.where(finished: true).where('created_at > ?', self.games.last.updated_at).count
        else
            'Player has not yet played a game.'
        end
    end
end
