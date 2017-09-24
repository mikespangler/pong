class AddWinnerToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :winner, :integer
  end
end
