class Blog::CommentsController < ApplicationController

  def create
    @post = Post.find_by(slug: params[:comment][:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      ActionCable.server.broadcast "comments_#{@post.slug}_channel", render(partial: 'blog/comments/comment', object: @comment)
    else
      flash[:alert] = "There was an error creating the comment.  Please try again."
      redirect_to blog_post_path(@post.slug)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end

end