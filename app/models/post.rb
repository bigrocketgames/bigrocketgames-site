class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, uniqueness: true
  validates :title, :body, :user_id, presence: true

  before_validation do
    if !self.title.nil?
      # strip any punctuation off the end of the title

      # strip off any whitespace and downcase the slug and replace any spaces with '-'
      self.title = title.strip()
      self.slug = self.title.downcase.gsub(" ", "-")
    end
  end
end
