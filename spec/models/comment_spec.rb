require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do

    before(:each) do
      @user = create(:user)
      @post = create(:post, user_id: @user.id)
    end

    it 'requires a post_id and body' do
      comment = create(:comment, post_id: @post.id, user_id: @user.id)
      comment1 = build(:comment, body: nil, user_id: nil)

      expect(comment.valid?).to eq(true)
      expect(comment1.valid?).to eq(false)
      expect(comment1.errors.full_messages).to eq([
        "Post must exist",
        "Post can't be blank",
        "Body can't be blank"
      ])
    end
  end

  describe 'relationships' do
    it 'belongs to a post' do
      user = create(:user)
      post = create(:post, user_id: user.id)
      comment = create(:comment, post_id: post.id, user_id: user.id)

      expect(comment.post.id).to_not eq(nil)
    end
  end
end
