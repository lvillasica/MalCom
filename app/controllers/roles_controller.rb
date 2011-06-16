class RolesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_role, :except => [:index, :new, :create]
  load_and_authorize_resource
  
  def index
    @roles = Role.all
  end
  
  def new
    @role = Role.new
  end
  
  def create
    @role = Role.new(params[:role])
    if @role.save
      redirect_to roles_path
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @role.update_attributes(params[:role])
      redirect_to roles_path
    else
      render :edit
    end
  end
  
  def destroy
    @role.destroy
    redirect_to roles_path
  end
  
  private
  
  def get_role
    @role = Role.find(params[:id])
  end
end
