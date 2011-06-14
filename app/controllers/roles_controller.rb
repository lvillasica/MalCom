class RolesController < ApplicationController

  def index
    @roles = Role.all
  end
  
  def new
    @role = Role.new
  end
  
  def create
    @role = Role.new(params[:role])
    @role.save
    redirect_to roles_path
  end
  
  def show
    @role = Role.find(params[:id])
  end
  
  def edit
    @role = Role.find(params[:id])
  end
  
  def update
    @role = Role.find(params[:id])
    @role.update_attributes(params[:role])
    redirect_to roles_path
  end
  
  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to roles_path
  end
end
