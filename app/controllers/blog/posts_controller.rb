class Blog::PostsController < ApplicationController

  def index
    @posts = Post.published.order(publishedDate: :desc).page(params[:page])
  end

  def show
    @post = Post.includes(:comments).find_by(slug: params[:id])
    @comment = Comment.new
  end

end