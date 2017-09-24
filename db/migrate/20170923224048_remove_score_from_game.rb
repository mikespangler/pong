class RemoveScoreFromGame < ActiveRecord::Migration[5.1]
  def change
    change_table :games do |t|
      t.remove :player_1_score, :player_2_score
    end
  end
end
