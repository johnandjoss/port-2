require 'rails_helper'


describe "the edit skill process" do
  it "updates a skill" do
    visit skills_path
    click_link 'Add a Skill'
    fill_in 'Name', :with => 'java'
    fill_in 'Description', :with => 'java for droid'
    click_on 'Create Skill'
    click_on 'java'
    click_on 'Edit Skill'
    fill_in 'Name', :with => 'javascript'
    click_on 'Update Skill'
    expect(page).to have_content 'javascript'
  end

  it "gives an error when no data is entered into form fields" do
    test_skill = Skill.create(:name => "ruby", :description => "rails stuff")
    visit edit_skill_path(test_skill)
    fill_in 'Name', :with => ''
    click_on 'Update Skill'
    expect(page).to have_content 'errors'
  end
end