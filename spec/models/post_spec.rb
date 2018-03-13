require 'rails_helper'

RSpec.describe Post, type: :model do

  before(:each) do
    @user = create(:user)
  end

  describe 'validations' do
    it 'requires a title, body, and user_id' do
      post = create(:post, user_id: @user.id)
      post1 = build(:post, title: nil, body: nil, status: nil, user_id: nil)

      expect(post.valid?).to eq(true)
      expect(post1.valid?).to eq(false)
      expect(post1.errors.full_messages).to eq([
        "User must exist",
        "Title can't be blank",
        "Body can't be blank",
        "User can't be blank",
        "Status can't be blank",
        "Intro can't be blank",
        "Slug can't be blank"
      ])
    end

    it "can't have a duplicate title" do
      post = create(:post, user_id: @user.id)
      post1 = build(:post, user_id: @user.id)

      expect(post.valid?).to eq(true)
      expect(post1.valid?).to eq(false)
      expect(post1.errors.full_messages).to eq([
        "Title has already been taken"
      ])
    end

  end

  describe 'relationships' do
    it 'has many comments' do
      post = create(:post, user_id: @user.id)
      comment = create(:comment, post_id: post.id, user_id: @user.id)
      comment1 = create(:comment, body: "this is also a comment", post_id: post.id, user_id: @user.id)

      expect(post.comments.length).to eq(2)
    end
  end

  context 'before validation' do
    it 'adds a slug to the post' do
      post = create(:post, user_id: @user.id)
      
      expect(post.title).to eq("Title of a post")
      expect(post.slug).to eq("title-of-a-post")
    end

    it 'creates the intro paragraph' do
      post = create(:post, user_id: @user.id)

      expect(post.intro).to_not eq(nil)
    end
  end
end
