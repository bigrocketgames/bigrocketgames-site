class AddLinkClassToBrowserGame < ActiveRecord::Migration[5.1]
  def change
    add_column :browser_games, :linkClass, :string
  end
end
