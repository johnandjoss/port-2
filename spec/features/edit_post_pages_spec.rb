require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "the edit a post process" do
  it "edit a post to the blog" do  
    visit skills_path
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    click_link 'Blog'
    click_link 'Add Post'
    fill_in 'Title', :with => post.title
    fill_in 'Body', :with => post.body
    click_on 'Create Post'
    click_link 'Edit'
    fill_in 'Title', :with => 'new title'
    fill_in 'Body', :with => 'new body'
    click_on 'Update Post'
    expect(page).to have_content 'Admin Page'
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
    click_link 'Edit'
    fill_in 'Title', :with => ''
    fill_in 'Body', :with => ''
    click_on 'Update Post'
    expect(page).to have_content 'errors'
  end

end