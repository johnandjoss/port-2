require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "the add a project process" do
  it "adds a new project" do
    test_skill = Skill.create(:name => "Section One", :description => "this")
    visit skill_path(test_skill)
    click_on 'Add a Project'
    fill_in 'Title', :with => 'Ruby'
    fill_in 'Content', :with => 'Blah Blah'
    fill_in 'Link', :with => "onetwo"
    click_on 'Create Project'
    expect(page).to have_content 'Section One'

  end

  it "gives an error when no data is entered into form fields" do
    test_skill = Skill.create(:name => "Section One", :description => "this")
    visit skill_path(test_skill)
    click_on 'Add a Project'
    fill_in 'Title', :with => ''
    fill_in 'Content', :with => ''
    fill_in 'Link', :with => ''
    click_on 'Create Project'
    expect(page).to have_content 'errors'
  end
end