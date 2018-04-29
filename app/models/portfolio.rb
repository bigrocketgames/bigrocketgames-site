class Portfolio < ApplicationRecord
  enum status: [ :draft, :published ]
  mount_uploader :screenshot, ScreenshotsUploader

  validates :title, :description, :features, presence: true
end
