class Admin::MobileGamesController < ApplicationController
  layout "admin"

  def index
  end

  def new
    @mobileGame = MobileGame.new
  end

  def create
    mobileGame = MobileGame.new(:mobileGamesParams)

    if mobileGame.save
      redirect_to admin_mobile_games_path
    else
      
      render :new
    end
  end


  private

  def mobileGamesParams
    params.require(:mobile_game).permit(:title, :description, :gameFeatures, {sliderImages: []})
  end

end