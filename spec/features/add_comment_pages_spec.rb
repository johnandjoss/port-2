
require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "the add a comment process" do
  it "adds a new comment to a post" do  
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
    expect(page).to have_content comment.content
  end

  it "gives an error when no data is entered into form fields" do
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
    fill_in 'Content', :with => ''
    click_on 'Create Comment'
    expect(page).to have_content 'What do you think you are doing??!!!'
  end

end