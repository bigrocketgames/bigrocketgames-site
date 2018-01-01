require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'requires a title, and body' do
      post = create(:post)
      post1 = build(:post, title: nil, body: nil)

      expect(post.valid?).to eq(true)
      expect(post1.valid?).to eq(false)
      expect(post1.errors.full_messages).to eq([
        "Title can't be blank",
        "Body can't be blank"
      ])
    end

    it "can't have a duplicate title" do
      post = create(:post)
      post1 = build(:post)

      expect(post.valid?).to eq(true)
      expect(post1.valid?).to eq(false)
      expect(post1.errors.full_messages).to eq([
        "Title has already been taken"
      ])
    end
  end

  describe 'relationships' do
    it 'has many comments' do
      post = create(:post)
      comment = create(:comment, post_id: post.id)
      comment1 = create(:comment, body: "this is also a comment", post_id: post.id)

      expect(post.comments.length).to eq(2)
    end
  end

  context 'before validation' do
    it 'adds a slug to the post' do
      post = create(:post)
      
      expect(post.title).to eq("Title of a post")
      expect(post.slug).to eq("title-of-a-post")
    end
  end
end
