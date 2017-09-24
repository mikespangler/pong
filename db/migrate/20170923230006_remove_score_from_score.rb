class RemoveScoreFromScore < ActiveRecord::Migration[5.1]
  def change
    change_table :scores do |t|
      t.remove :score
    end
  end
end
