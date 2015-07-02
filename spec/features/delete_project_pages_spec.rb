require 'rails_helper'

describe "the delete project process" do
  it "deletes a project" do
    test_skill = Skill.create(:name => "Java", :description => "stuffy")
    test_project = Project.create(:title => "project 1", :content => "blah", :link=> "www", :skill_id => test_skill.id)
    visit skill_project_path(test_skill,test_project)
    click_on 'Delete'
    expect(page).to have_no_content 'project 1'
  end
end