require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "the add a skill process" do
  it "adds a new skill" do  
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
    expect(page).to have_content 'Skills'
  end
  
  it "gives an error when no data is entered into form fields" do
    visit root_path
    click_on "Sign Up"
    fill_in "Name", with: "jocelyn alsdorf"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"
    click_link 'Add a Skill'
    fill_in 'Name', :with => ''
    fill_in 'Description', :with => ''
    click_on 'Create Skill'
    expect(page).to have_content 'errors'
  end

end

 

