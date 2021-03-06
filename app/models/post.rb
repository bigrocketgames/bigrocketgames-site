class Post < ApplicationRecord
  enum status: [ :draft, :published ]
  belongs_to :user
  has_many :comments

  validates :title, uniqueness: true
  validates :title, :body, :user_id, :status, :intro, :slug, presence: true

  before_validation do
    if !self.title.nil? && self.slug != self.title.downcase.gsub(" ", "-")
      # strip any punctuation off the end of the title
      while (self.title.rindex(/[?.!<>&^*()@#$%\s]/) == self.title.length-1) do
        self.title[self.title.length-1] = ""
      end

      # strip off any whitespace and downcase the slug and replace any spaces with '-'
      self.title = self.title.strip()
      self.slug = self.title.downcase.gsub(" ", "-")
    end

    
    self.intro = self.body.split("</p>")[0].delete_prefix("<p>") + ".." if !self.title.nil?
  end

end
