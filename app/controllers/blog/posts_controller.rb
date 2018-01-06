class Blog::PostsController < ApplicationController

  def index
    @posts = Post.all.order(:created_at)
  end

  def show
    @post = Post.find_by(slug: params[:id])
  end

end