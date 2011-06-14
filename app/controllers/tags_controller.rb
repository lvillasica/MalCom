class TagsController < ApplicationController

  before_filter :get_project
  before_filter :get_tag, :only => [:edit, :update, :show, :destroy]
  
  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(params[:tag])
    puts params.inspect
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @tag.update_attributes(params[:tag])
    redirect_to root_url
  end
  
  def destroy
    @tag.destroy
    redirect_to root_url
  end
  
  private
  
  def get_project
    @project = Project.find(params[:project_id])
  end
  
  def get_tag
    @tag = Tag.find(params[:id])
  end
  
end
