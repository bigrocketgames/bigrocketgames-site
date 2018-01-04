require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'vaildations' do
    it 'requires an email and password' do
      user = build(:user, email: nil, password_digest: nil)

      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq([
        "Password can't be blank",
        "Email can't be blank",
        "Email is invalid"
      ])
    end

    it 'requires that an email is unique' do
      create(:user)
      user = build(:user)

      expect(user.valid?).to eq(false)
      expect(user.errors.full_messages).to eq([
        "Email has already been taken"
      ])
    end

    it 'requires that an email is valid (contains an @ symbol and a (.com, .org, etc...)' do
      user1 = build(:user, email: "test.com")
      user2 = build(:user, email: "test@test")
      user3 = build(:user, email: "test")

      expect(user1.valid?).to eq(false)
      expect(user2.valid?).to eq(false)
      expect(user3.valid?).to eq(false)
    end
  end

  describe 'on save' do
    it 'hashes a password' do
      user = build(:user)
      user.save

      expect(user.password_digest).not_to eq(user.password)
    end
  end

  describe 'relationships' do
    it 'has many posts' do
      user = create(:user)
      user.posts.create(title: "fun with words", body: "this is a body")
      user.posts.create(title: "title 2", body: "body 2")

      expect(user.posts.length).to eq(2)
    end

    it 'has many comments' do
      user = create(:user)
      user.comments.create(body: "i like it")
      user.comments.create(body: "good stuff")

      expect(user.comments.length).to eq(2)
    end
  end

end
