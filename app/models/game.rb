class Game < ApplicationRecord
    validates_presence_of :player_1_id, :player_2_id
    belongs_to :player_1, :class_name => "Player", foreign_key: "player_1_id"
    belongs_to :player_2, :class_name => "Player", foreign_key: "player_2_id"
    has_many :scores
    has_many :players

    def names_index
        {
            self.player_1_id => self.player_1.name,
            self.player_2_id => self.player_2.name
        }
    end

    def finished?
        scores_by_key.values.any? { |score| score >= 21 }
    end

    # player 1 always begins service 
    def service
        
    end

    def scores_by_key
        self.scores.group(:player_id).count
    end

    def scoreboard
        scores_by_name = {}
        scores_by_key.each do |id, score|
            scores_by_name[self.names_index[id]] = score
        end
        scores_by_name
    end
end
