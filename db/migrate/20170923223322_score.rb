class Score < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
        t.integer :player_id, :foreign_key => true
        t.integer :game_id, :foreign_key => true
        t.integer :score, :default => 0
        t.timestamps
    end
  end
end
