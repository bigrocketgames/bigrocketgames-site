class AddScreenshotToBrowserGame < ActiveRecord::Migration[5.1]
  def change
    add_column :browser_games, :screenshot, :string
  end
end
