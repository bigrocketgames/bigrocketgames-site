class Admin::PortfolioController < ApplicationController

  def index
    @portfolios = Portfolio.all
  end

  def show
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    portfolio = Portfolio.new(portfolio_params)

    if portfolio.save
      redirect_to admin_portfolio_index_path
    else
      render :new
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :description, :features, :screenshot)
  end

end