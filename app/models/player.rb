class Player < ApplicationRecord
    validates_presence_of :name
    def games
        Game.where("player_1_id = ? OR player_2_id = ?", self.id, self.id)
    end
end
