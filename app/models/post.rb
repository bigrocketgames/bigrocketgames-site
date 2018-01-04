class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, uniqueness: true
  validates :title, :body, :user_id, presence: true

  before_validation do
    if !title.nil?
      self.title = title.strip()
      self.slug = self.title.downcase.gsub(" ", "-")
    end
  end
end
