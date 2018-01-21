class PortfolioController < ApplicationController

  def index
    @portfolios = Portfolio.all.order(:title)
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

end