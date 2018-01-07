class Portfolio < ApplicationRecord
  mount_uploader :screenshot, ScreenshotsUploader

  validates :title, :description, :features, presence: true
end
