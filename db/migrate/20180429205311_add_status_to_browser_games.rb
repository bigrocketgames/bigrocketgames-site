class AddStatusToBrowserGames < ActiveRecord::Migration[5.1]
  def change
    add_column :browser_games, :status, :integer, default: 0
  end
end
