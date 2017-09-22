class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
        t.integer :player_1_id 
        t.integer :player_2_id        
        t.integer :player_1_score, :default => 0
        t.integer :player_2_score, :default => 0
        t.boolean :finished, :default => false
        t.timestamps
    end
  end
end
