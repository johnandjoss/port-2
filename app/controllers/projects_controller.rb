class ProjectsController < ApplicationController

	def show
	    @skill = Skill.find(params[:skill_id])
	    @project = Project.find(params[:id])
	end

	def new
	    @skill = Skill.find(params[:skill_id])
	    @project = Project.new
	end

	def create
	  @skill = Skill.find(params[:skill_id])
	  @project = Project.new(project_params)
	  if @project.save
	    flash[:notice] = "Project added!!"
	    redirect_to skill_path(@project.skill_id)
	  else
	    render :new
	  end
	end

	def edit
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to skill_project_path(@skill, @project)
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to skill_path(@skill)
  end
  
  private
  def project_params
    params.require(:project).permit(:title, :content, :link, :skill_id)
  end

end