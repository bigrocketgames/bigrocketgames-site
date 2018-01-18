class Admin::PostsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :check_admin
  before_action :get_post, only: [ :edit, :update, :destroy]

  def index
    @posts = Post.all.order(:id)
  end

  def new
    @post = Post.new
  end

  def create
      @post = Post.new(post_params)

      if @post.status == "published"
        @post.publishedDate = Time.now()
      end

      if @post.save
        # show success message and redirect to the newly created post page
        flash[:success] = "Successfully created post!"
        redirect_to admin_posts_path
      else
        # show error that post did not save and redirect back to new form.
        flash[:alert] = "Error creating new post!"
        render :new
      end
  end

  def edit
  end

  def update
    if params[:post][:status] == "published" && @post.publishedDate == nil
      @post.publishedDate = Time.now()
    end

    if @post.update(post_params)
      # show success message and redirect to the newly created post page
      flash[:success] = "Successfully updated post!"
      redirect_to admin_posts_path
    else
      # show error that post did not save and redirect back to new form.
      flash[:alert] = "Error updating post!"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      # show success message and redirect to the admin posts page
      flash[:success] = "Successfully deleted post!"
      redirect_to admin_posts_path
    else
      # show error that post did not delete.
      flash[:alert] = "Error deleting post!"
      redirect_to admin_posts_path
    end
  end

  private

  def get_post
    @post = Post.find_by(id: params[:id])
  end

  def check_admin
    if !current_user.admin?
      flash[:alert] = "You are not authorized for this action."
      redirect_to home_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :status, :publishedDate)
  end

end