require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  describe 'validations' do
    it 'requires a title, description, and features' do
      portfolio = create(:portfolio)
      portfolio1 = build(:portfolio, title: "", description: nil, features: nil)

      expect(portfolio.valid?).to eq(true)
      expect(portfolio1.valid?).to eq(false)
      expect(portfolio1.errors.full_messages).to eq([
        "Title can't be blank",
        "Description can't be blank",
        "Features can't be blank"
      ])
    end
  end
end
