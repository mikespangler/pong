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

    def rewind!
        self.scores.order('created_at DESC').first.destroy!
    end

    def update_service!
        score_count = self.scores.count
        if score_count > 0 && score_count % 3 == 0
            current_service = self.service == 1 ? 2 : 1
            self.update(service: current_service)
        end
    end

    def serving
        self.names_index[self.service]
    end

    def finished
        scores_by_key.values.any? { |score| score >= 21 }
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
