class Blog::PostsController < ApplicationController
before_action :get_post, only: [:show, :update, :destroy]
# need to implement JWT for admin side to make sure updating posts is done only by those authorized
# before_action :authenticate_token!, only: [:create, :update, :destory]

  def index
    @posts = Post.all
  end

  def show
    @post
  end

  def create
    if @user.admin
      post = Post.new(post_parmas)

      if post.save
        # show success message?
        # maybe go to the post?
      else
        # show error that post did not save
      end

    else 
      # show unauthorized error 
    end
  end

  private

  def get_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    parms.require(:post).permit(:title, :body)
  end

end