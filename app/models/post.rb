class Post < ApplicationRecord
  has_many :comments

  validates :title, uniqueness: true
  validates :title, :body, presence: true

  before_validation do
    if !title.nil?
      self.title = title.strip()
      self.slug = self.title.downcase.gsub(" ", "-")
    end
  end
end
