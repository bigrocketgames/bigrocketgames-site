class PortfolioController < ApplicationController

  def index
    @portfolios = Portfolio.published.order(:title)
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

end