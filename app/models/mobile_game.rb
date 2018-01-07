class MobileGame < ApplicationRecord
  mount_uploaders :sliderImages, ImageUploader

  validates :title, uniqueness: true
  validates :title, :description, :gameFeatures, presence: true
  
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
  end
end
