require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "the delete a post process" do
  it "adds a new post to the blog" do  
    visit skills_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    click_link 'Blog'
    click_link 'Add Post'
    fill_in 'Title', :with => post.title
    fill_in 'Body', :with => post.body
    click_on 'Create Post'
    click_link 'Delete Post'
    expect(page).to have_content 'Admin Page'
  end

end