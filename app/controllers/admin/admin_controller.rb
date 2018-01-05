class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  

  def home
  end

  def login
  end

end