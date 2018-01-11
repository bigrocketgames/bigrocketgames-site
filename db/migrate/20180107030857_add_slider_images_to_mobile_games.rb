class AddSliderImagesToMobileGames < ActiveRecord::Migration[5.1]
  def change
    add_column :mobile_games, :sliderImages, :json
  end
end
