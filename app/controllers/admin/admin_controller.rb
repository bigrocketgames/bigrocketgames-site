class Admin::AdminController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  

  def home
  end

  def login
  end

end