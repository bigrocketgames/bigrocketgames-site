class CommentsChannel < ApplicationCable::Channel
  
  def subscribed
    stream_from "comments_#{params['post_slug']}_channel"
  end

  def unsubscribed
  end

end