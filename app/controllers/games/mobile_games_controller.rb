class Games::MobileGamesController < ApplicationController

  def index
    @mobileGames = MobileGame.published.order(:title)
  end

  def show
    @mobileGame = MobileGame.find_by(id: params[:id])
  end
  
end
