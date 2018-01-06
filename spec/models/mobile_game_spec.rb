require 'rails_helper'

RSpec.describe MobileGame, type: :model do
  
  describe 'Validations' do
    
    it 'requires a title, description and gamefeatures' do
      mobileGame = create(:mobile_game)

      expect(mobileGame.valid?).to eq(true)
    end

    it "doesn't allow duplicate titles" do
      mGame = create(:mobile_game)
      mGame1 = build(:mobile_game)

      expect(mGame.valid?).to eq(true)
      expect(mGame1.valid?).to eq(false)
      expect(mGame1.errors.full_messages).to eq([
        "Title has already been taken"
      ])
    end

  end

  describe 'before validations' do
    it 'adds a slug to the model' do
      mGame = MobileGame.new(title: "This is a new mobile game", description: "This is the mobile game description", gameFeatures: "feature1::feature2::feature3")

      expect(mGame.slug).to eq(nil)
      
      mGame.save

      expect(mGame.slug).to_not eq(nil)
    end
  end

end
