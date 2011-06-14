class UsersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :get_user, :except => [:index] 
  
  load_and_authorize_resource
  
  def index
    @users = User.all
  end
  
  def show
  end
  
  def destroy
    @user.destroy
    redirect_to users_url
  end
  
  private
  
  def get_user
    @user = User.find(params[:id])
  end
  
end
