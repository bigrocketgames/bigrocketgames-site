require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    
    before(:each) do
      @post = create(:post)
    end

    it 'requires a post_id and body' do
      comment = create(:comment, post_id: @post.id)
      comment1 = build(:comment, body: nil)

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
      post = create(:post)
      comment = create(:comment, post_id: post.id)

      expect(comment.post.id).to_not eq(nil)
    end
  end
end
