class Comment < ApplicationRecord
  belongs_to :post

  validates :post_id, :body, presence: true
  validates :body, uniqueness: true
end
