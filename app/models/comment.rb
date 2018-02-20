class Comment < ApplicationRecord
  belongs_to :post

  validates :post_id, :body, presence: true
  validates :body, uniqueness: true

  # after_create_commit { CommentBroadcastJob.perform_later(self) }
end
