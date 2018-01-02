require 'rails_helper'

RSpec.describe "Posts", Type: :feature do

  before(:each) do
    @post = create(:post)
    @post1 = create(:post, title: "hello second post", body: "this is another great post, about more fun stuff")
    
    @comment = create(:comment, post_id: @post.id)
    @comment1 = create(:comment, body: "This is another comment on a great post", post_id: @post.id)
  end

  describe "GET blog/posts" do

    it "shows all posts on the page" do
      visit 'blog/posts'
      
      expect(page).to have_content @post.title
      expect(page).to have_content @post.body
      expect(page). to have_content @post.comments.length
      expect(page).to have_content @post1.title
      expect(page).to have_content @post1.body
      expect(page).to have_content @post1.comments.length
    end
  end

  describe "GET blog/post/:id" do
  
    it "shows the content of only the post whose id is in the path" do
      visit "blog/posts/#{@post.id}"

      expect(page).to_not have_content @post1.title
      expect(page).to_not have_content @post1.body
      expect(page).to have_content @post.title
      expect(page).to have_content @post.body
      expect(page).to have_content @post.comments[0].body
      expect(page).to have_content @post.comments[1].body
    end 
  end

  describe "POST blog/post/new" do

    it "let's a new post be created from the form" do

      visit '/blog/posts/new'

      within("#new_post") do
        fill_in 'post_title', with: "Another title to a post"
        fill_in 'post_body', with: "The body of the post"
      end

      click_button 'Create Post'
      expect(page).to have_content "Successfully created post!"
      expect(page).to have_content "Another title to a post"
      expect(page).to have_content "The body of the post"
    end
  end

end