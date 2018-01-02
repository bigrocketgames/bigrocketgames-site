class Blog::CommentsController < ApplicationController
  
  def index
    @comments = Comment.where("post_id = ?", params[:post_id]).order(:created_at)
  end

end