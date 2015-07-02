require 'rails_helper'

describe "the delete skill process" do
  it "deletes a skill" do
    test_skill = Skill.create(:name => "Dumb Stuff", :description => "learning")
    visit skill_path(test_skill)
    click_on 'Delete Skill'
    expect(page).to have_no_content 'Dumb Stuff'
  end
end