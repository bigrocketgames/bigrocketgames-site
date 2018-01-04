class AuthController < ApplicationController
  before_action :authentication_token!, only: [:refresh]

  def login
    @user = User.find_by(email: params[:user][:email].to_s.downcase)

    if !@user
      # render error for no account with provided email & status: 500
    elsif @user && @user.authenticate(params[:user][:password])
      # redirect to admin_home_path and save the token to local storage
    else
      # render error for password not matching & status: 500
    end
  end

  def refresh
    # save updated token to local storage
  end

end