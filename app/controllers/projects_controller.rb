class ProjectsController < ApplicationController

  before_filter :authenticate_user!
  skip_authorize_resource :only => :index
  before_filter :get_project, :except => [:index, :new, :create, :projects, :remove_member]
  load_and_authorize_resource
  
  def index
    @projects = current_user.projects.all
  end
  
  def new
    @project = Project.new
  end

  def members
    @members = @project.users
  end

  def overview
  end
  
  def show
    @tags = @project.tags
  end
  
  def create
    @project = Project.new(params[:project])
    
    if @project.save
      redirect_to projects_path
      flash[:project_notice] = "#{@project.project_name} added."
    else
      render :new
    end
  end
  
  def projects
    @projects = Project.all
  end
  
  def edit
  end
  
  def update
    if @project.update_attributes(params[:project])
      redirect_to admin_projects_path
    else
      render :edit
    end
  end
    
  def destroy
    @project.destroy
    redirect_to admin_projects_path
  end

  def add_member
    #@member = User.find(params[:user_id])
    #@project = @member.projects.find(params[:id])

    #if @project
    #  @member.projects.delete(@project)
    #end
    @project.update_attributes(params[:project])    
    redirect_to members_project_path(@project)
  end
  
  private
  
  def get_project
    @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url
  end

end
