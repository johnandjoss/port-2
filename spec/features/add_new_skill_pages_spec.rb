require 'rails_helper'

describe "the add a skill process" do
  it "adds a new skill" do
    visit skills_path
    click_on 'Add a Skill'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Description', :with => 'Ruby and rails'
    click_on 'Create Skill'
    expect(page).to have_content 'Skills'
  end
  it "gives an error when no data is entered into form fields" do
    visit new_skill_path
    click_on 'Create Skill'
    expect(page).to have_content 'errors'
  end

end