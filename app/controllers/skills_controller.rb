class SkillsController < ApplicationController

 def index
    @skills = Skill.all
  end

  def show
    @skill = skill.find(params[:id])
  end



end