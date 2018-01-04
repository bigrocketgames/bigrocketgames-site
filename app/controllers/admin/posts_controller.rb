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

  def new
    @post = Post.new
  end

  def create
    # if @user.admin
      post = Post.new(post_params)

      if post.save
        # show success message and redirect to the newly created post page
        flash[:success] = "Successfully created post!"
        redirect_to blog_post_path(post)
      else
        # show error that post did not save and redirect back to new form.
        flash[:alert] = "Error creating new post!"
        render :new
      end

    # else 
      # show unauthorized error 
    # end
  end

  private

  def get_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end