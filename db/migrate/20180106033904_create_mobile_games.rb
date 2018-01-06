class CreateMobileGames < ActiveRecord::Migration[5.1]
  def change
    create_table :mobile_games do |t|
      t.string :title
      t.text :description
      t.text :gameFeatures
      t.text :slug

      t.timestamps
    end
  end
end
