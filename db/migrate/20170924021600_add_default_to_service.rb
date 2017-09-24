class AddDefaultToService < ActiveRecord::Migration[5.1]
  def change
    change_column :games, :service, :integer, default: 1
  end
end
