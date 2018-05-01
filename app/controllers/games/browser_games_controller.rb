class Games::BrowserGamesController < ApplicationController
  layout "browserGame", only: [:show]

  def index
    @browserGames = BrowserGame.published.order(:title)
  end
  
  def show
    @browserGame = BrowserGame.find_by(slug: params[:id])
  end

end