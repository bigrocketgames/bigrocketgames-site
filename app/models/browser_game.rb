class BrowserGame < ApplicationRecord
  enum :status [ :draft, :published ]
  mount_uploader :screenshot, ScreenshotsUploader
  
  validates :title, uniqueness: true
  validates :title, :description, :instructions, presence: true
  
  before_validation do
    if !self.title.nil?
      # strip any punctuation off the end of the title
      while (self.title.rindex(/[?.!<>&^*()@#$%\s]/) == self.title.length-1) do
        self.title[self.title.length-1] = ""
      end

      # strip off any whitespace and downcase the slug and replace any spaces with '-'
      self.title = self.title.strip()
      self.slug = self.title.downcase.gsub(" ", "-")
    end

    linkClass = ""

    self.slug.split("-").each do |word|
      linkClass += word[0]
    end

    self.linkClass = "#{linkClass}-game-link"
  end
end
