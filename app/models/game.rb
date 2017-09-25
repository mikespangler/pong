class Game < ApplicationRecord
    validates_presence_of :player_1_id, :player_2_id
    belongs_to :player_1, :class_name => "Player", foreign_key: "player_1_id"
    belongs_to :player_2, :class_name => "Player", foreign_key: "player_2_id"
    has_many :scores
    has_many :players

    def rewind!
        self.scores.order('created_at DESC').first.destroy!
        self.update_stats!
    end

    # update from ScoreController
    def update_stats!
        self.update!(finished: check_finished, winner: check_winner, service: check_service)
    end

    def score_count
        self.scores.count
    end

    def check_service
        # Service switches every third serve
        if score_count > 0 && score_count % 3 == 0
            self.service == 1 ? 2 : 1
        else
            self.service
        end
    end

    def check_winner
        check_finished ? self.scores.last.player.id : nil
    end

    def check_finished
        # TODO: account for games that tie, and go beyond 21
        scoreboard.values.any? { |score| score >= 21 }
    end

    def scoreboard
        # This will be inaccurate if the players share a name. Fix is to write raw SQL query that selects name while grouping on ID.
        self.scores.joins(:player).group(:name).count
    end
end
