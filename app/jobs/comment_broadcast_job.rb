class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "comments_#{comment.post.slug}_channel", comment: render_comment(comment)
  end

  private

  def render_comment(comment)
    Blog::CommentsController.render partial: 'blog/comments/comment', locals: {comment: comment}
  end
end