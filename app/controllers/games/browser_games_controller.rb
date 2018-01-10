class Games::BrowserGamesController < ApplicationController

  def index
    @browserGames = BrowserGame.all.order(:title)
  end
  
  def show
    @browserGame = BrowserGame.find_by(id: params[:id])
  end

end