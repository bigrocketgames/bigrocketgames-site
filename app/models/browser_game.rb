class BrowserGame < ApplicationRecord
  validates :title, :description, :gameFeatures, presence: true
  
end
