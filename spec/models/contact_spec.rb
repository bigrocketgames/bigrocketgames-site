require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'validations' do
    it 'requires name, email, subject, and body' do
      contact = create(:contact)

      expect(contact.valid?).to eq(true)
    end
  end
end
