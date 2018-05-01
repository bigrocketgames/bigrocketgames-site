class Admin::MobileGamesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :check_admin
  before_action :get_mobileGame, only: [:edit, :update, :destroy]

  def index
    @mobileGames = MobileGame.all.order(:id)
  end

  def new
    @mobileGame = MobileGame.new
  end

  def create
    mobileGame = MobileGame.new(mobileGamesParams)

    if mobileGame.save
      # show success message and redirect to the admin mobile games list
      flash[:success] = "Successfully created mobile game!"
      redirect_to admin_mobile_games_path
    else
      # show error that mobile game did not save and redirect back to new form.
      flash[:alert] = "Error creating new mobile game!"
      render :new
    end
  end

  def edit
  end

  def update
    if @mobileGame.update(mobileGamesParams)
      # show success message and redirect to the admin mobile games list
      flash[:success] = "Successfully updated mobile game!"
      redirect_to admin_mobile_games_path
    else
      # show error that mobile game did not update and redirect back to new form.
      flash[:alert] = "Error updating mobile game!"
      render :new
    end
  end

  def destroy
    if @mobileGame.update(mobileGamesParams)
      # show success message and redirect to the admin mobile games list
      flash[:success] = "Successfully deleted mobile game!"
      redirect_to admin_mobile_games_path
    else
      # show error message and redirect to the admin mobile games list
      flash[:alert] = "Error deleting mobile game!"
      redirect_to admin_mobile_games_path
    end
  end

  private
  
  def get_mobileGame
    @mobileGame = MobileGame.find_by(id: params[:id])
  end

  def check_admin
    if !current_user.admin?
      flash[:alert] = "You are not authorized for this action."
      redirect_to home_path
    end
  end

  def mobileGamesParams
    params.require(:mobile_game).permit(:title, :description, :gameFeatures, :status, {sliderImages: []})
  end

end