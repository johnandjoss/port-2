require 'rails_helper'

describe "the view all skills process" do
  it "views all skills" do
    visit skills_path
    click_link 'Add a Skill'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Description', :with => 'Ruby and rails'
    click_on 'Create Skill'
    expect(page).to have_content 'Skills'
    click_link 'All Skills'
    expect(page).to have_content 'All Skills'
  	end
  end