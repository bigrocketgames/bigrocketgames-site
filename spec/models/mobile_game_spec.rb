require 'rails_helper'

RSpec.describe MobileGame, type: :model do
  
  describe 'Validations' do
    
    it 'requires a title, description and gamefeatures' do
      
      mobileGame = create(:mobile_game)

      expect(mobileGame.valid?).to eq(true)
    end

  end

end
