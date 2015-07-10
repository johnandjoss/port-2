require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "the delete a project process" do
  it "deletes a project" do  
    visit root_path
    click_on "Sign Up"
    fill_in "Name", with: "jocelyn alsdorf"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"
    click_link 'Add a Skill'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Description', :with => 'Ruby and rails'
    click_on 'Create Skill'
    click_link 'Ruby'
    click_link 'Add a Project'
    fill_in 'Title', :with => 'Ruby site'
    fill_in 'Content', :with => 'Blah Blah'
    fill_in 'Link', :with => "onetwo"
    click_on 'Create Project'
    click_link 'Ruby site'
    click_link 'Delete'
    expect(page).to have_content 'Ruby'
  end
  

end


