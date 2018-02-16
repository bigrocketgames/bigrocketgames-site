class Comment < ApplicationRecord
  belongs_to :post

  validates :post_id, :body, :user_id, presence: true
  validates :body, uniqueness: true
end
