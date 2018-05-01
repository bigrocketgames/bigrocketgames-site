class Admin::PortfolioController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :check_admin
  before_action :get_portfolio, only: [:edit, :update, :destroy]

  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    portfolio = Portfolio.new(portfolio_params)

    if portfolio.save
      # show success message and redirect to the admin/portoflio page.
      flash[:success] = "Successfully created portfolio site!"
      redirect_to admin_portfolio_index_path
    else
      # show error that portfolio did not update and redirect back to the edit form.
      flash[:alert] = "Error creating site!"
      render :new
    end
  end

  def edit
  end

  def update
    if @portfolio.update(portfolio_params)
      # show success message and redirect to the admin/portoflio page.
      flash[:success] = "Successfully updated portfolio!"
      redirect_to admin_portfolio_index_path
    else
      # show error that portfolio did not update and redirect back to the edit form.
      flash[:alert] = "Error updating portfolio!"
      render :edit
    end
  end

  def destroy
    if @portfolio.destroy
      # show success message and redirect to the admin portfolios page
      flash[:success] = "Successfully deleted portfolio!"
      redirect_to admin_portfolio_index_path
    else
      # show error that portfolio did not delete.
      flash[:alert] = "Error deleting portfolio!"
      redirect_to admin_portfolio_index_path
    end
  end

  private

  def get_portfolio
    @portfolio = Portfolio.find_by(id: params[:id])
  end

  def check_admin
    if !current_user.admin?
      flash[:alert] = "You are not authorized for this action."
      redirect_to home_path
    end
  end

  def portfolio_params
    params.require(:portfolio).permit(:title, :description, :features, :screenshot, :siteLink, :sourceCodeLink, :status)
  end

end