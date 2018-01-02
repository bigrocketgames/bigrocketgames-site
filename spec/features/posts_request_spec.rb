require 'rails_helper'

RSpec.describe "Posts", Type: :feature do

  before(:each) do
    @post = create(:post)
    @post1 = create(:post, title: "hello second post", body: "this is another great post, about more fun stuff")
    
    @comment = create(:comment, post_id: @post.id)
    @comment1 = create(:comment, body: "This is another comment on a great post", post_id: @post.id)
  end

  describe "GET /posts" do

    it "shows all posts on the page" do
      visit '/posts'
      
      expect(page).to have_content @post.title
      expect(page).to have_content @post.body
      expect(page). to have_content @post.comments.length
      expect(page).to have_content @post1.title
      expect(page).to have_content @post1.body
      expect(page).to have_content @post1.comments.length
    end
  end

  describe "GET /post/:id" do
  
    it "shows the content of only the post whose id is in the path" do
      visit "/posts/#{@post.id}"

      expect(page).to_not have_content @post1.title
      expect(page).to_not have_content @post1.body
      expect(page).to have_content @post.title
      expect(page).to have_content @post.body
      expect(page).to have_content @post.comments[0].body
      expect(page).to have_content @post.comments[1].body
    end 
  end

end