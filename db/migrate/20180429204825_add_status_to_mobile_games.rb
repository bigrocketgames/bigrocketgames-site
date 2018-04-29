class AddStatusToMobileGames < ActiveRecord::Migration[5.1]
  def change
    add_column :mobile_games, :status, :integer, default: 0
  end
end
