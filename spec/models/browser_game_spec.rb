require 'rails_helper'

RSpec.describe BrowserGame, type: :model do
  describe 'validations' do
    it 'requires a title, description, and instructions' do
      bGame = build(:browser_game, title: "", description: nil, instructions: nil)

      expect(bGame.valid?).to eq(false)
      expect(bGame.errors.full_messages).to eq([
        "Title can't be blank",
        "Description can't be blank",
        "Instructions can't be blank"
      ])
    end

    it "can't have a duplicate title" do
      bGame = create(:browser_game)
      bGame1 = build(:browser_game)

      expect(bGame.valid?).to eq(true)
      expect(bGame1.valid?).to eq(false)
      expect(bGame1.errors.full_messages).to eq([
        "Title has already been taken"
      ])
    end
  end

  describe 'before validation' do
    it 'adds a slug to the model' do
      bGame = BrowserGame.new(title: "This is a new broswer game", description: "This is a game description", instructions: "Use these to play the game")

      expect(bGame.slug).to eq(nil)

      bGame.save

      expect(bGame.slug).to_not eq(nil)
    end
  end
end
