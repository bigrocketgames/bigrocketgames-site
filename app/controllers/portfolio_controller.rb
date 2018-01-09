class PortfolioController < ApplicationController

  def index
    @portfolios = Portfolio.all
  end

  def show
  end

end