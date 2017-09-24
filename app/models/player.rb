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
        if games_played > 0
            (self.games.where(:winner => self.id).count / games_played) * 100
        else
            0
        end
    end

    def games_since_last_play
        time = self.games.where(:finished => true).order('updated_at DESC').select('updated_at').first
        Game.where("created_at > #{time}").count
    end
end
