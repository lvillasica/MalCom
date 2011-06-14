class ProjectsController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @projects = current_user.projects.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    
    @project.save
    redirect_to projects_path
  end
  
  def projects
    @projects = Project.all
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])  
    @project.update_attributes(params[:project])
    redirect_to admin_projects_path
  end
    
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to admin_projects_path
  end

end
