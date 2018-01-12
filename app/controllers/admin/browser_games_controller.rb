class Admin::BrowserGamesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :check_admin
  before_action :get_browserGame, only: [:edit, :update, :destroy]

  def index
    @browserGames = BrowserGame.all.order(:id)
  end

  def new
    @browserGame = BrowserGame.new
  end

  def create
    browserGame = BrowserGame.new(browserGame_params)

    if browserGame.save
      # show success message and redirect to the admin browser games list
      flash[:success] = "Successfully created browser game!"
      redirect_to admin_browser_games_path
    else
      # show error that browser game did not save and redirect back to new form.
      flash[:alert] = "Error creating new browser game!"
      render :new
    end
  end

  def edit
  end

  def update
    if @browserGame.update(browserGame_params)
      # show success message and redirect 
      flash[:success] = "Successfully updated browser game!"
      redirect_to admin_browser_games_path
    else
      # show error and redirect
      flash[:alert] = "Error updating browser game!"
      render :new
    end
  end

  def destroy
    if @browserGame.destroy
      # show success message and redirect to the admin browser games list
      flash[:success] = "Successfully deleted browser game!"
      redirect_to admin_browser_games_path
    else
      # show error and redirect.
      flash[:alert] = "Error deleting browser game!"
      redirect_to admin_browser_games_path
    end
  end

  private

  def check_admin
    if !current_user.admin?
      flash[:alert] = "You are not authorized for this action."
      redirect_to home_path
    end
  end

  def get_browserGame
    @browserGame = BrowserGame.find_by(id: params[:id])
  end

  def browserGame_params
    params.require(:browser_game).permit(:title, :description, :instructions, :screenshot)
  end

end