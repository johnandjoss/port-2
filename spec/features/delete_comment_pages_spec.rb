require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "the delete a comment process" do
  it "delete a comment from a post" do  
    visit skills_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    click_link 'Blog'
    click_link 'Add Post'
    fill_in 'Title', :with => post.title
    fill_in 'Body', :with => post.body
    click_on 'Create Post'
    comment = FactoryGirl.create(:comment)
    fill_in 'Content', :with => comment.content
    click_on 'Create Comment'
    click_link comment.content
    click_link 'Delete'
    expect(page).to have_content 'Admin Page'
  end

end