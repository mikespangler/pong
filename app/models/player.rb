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
            time = self.games.where(:finished => true).order('updated_at DESC').select('updated_at').first
            byebug
            Game.where(:finished => true).where("created_at > ?", time).count
        else
            'Player has not yet played a game.'
        end
    end
end
