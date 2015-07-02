require 'rails_helper'

describe "the edit project process" do
  it "updates a project" do
    test_skill = Skill.create(:name => "Java", :description => "stuff")
    test_project = Project.create(:title => "project", :content => "blah", :link => "here", :skill_id => test_skill.id)
    visit skill_project_path(test_skill, test_project)
    click_on 'Edit'
    fill_in 'Title', :with => 'Brat'
    fill_in 'Content', :with => 'Bratty'
    fill_in 'Link', :with => "www.not"
    click_on 'Update Project'
    expect(page).to have_content 'Brat'
  end

  it "gives an error when no data is entered into form fields" do
    test_skill = Skill.create(:name => "Java", :description => "stuff")
    test_project = Project.create(:title => "project", :content => "blah", :link => "here", :skill_id => test_skill.id)
    visit edit_skill_project_path(test_skill, test_project)
    fill_in 'Title', :with => ''
    click_on 'Update Project'
    expect(page).to have_content 'errors'
  end
end