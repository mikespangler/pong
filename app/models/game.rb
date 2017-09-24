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

    def serving
        self.names_index[self.service]
    end

    def rewind!
        self.scores.order('created_at DESC').first.destroy!
        self.update_stats!
    end

    def update_stats!
        self.update!(finished: check_finished, winner: check_winner, service: check_service)
    end

    def check_service
        score_count = self.scores.count
        if score_count > 0 && score_count % 3 == 0
            self.service == 1 ? 2 : 1
        else
            self.service
        end
    end

    def check_winner
        if check_finished
            self.scores.group(:player_id).index(self.scores.group(:player_id).values.max)
        else
            nil
        end
    end

    def winner_name
        self.names_index[self.winner]
    end

    def check_finished
        # TODO: account for games that go over 21
        scoreboard.values.any? { |score| score >= 21 }
    end

    def scoreboard
        self.scores.joins(:player).group(:name).count
    end
end
