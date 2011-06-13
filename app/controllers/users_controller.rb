class UsersController < ApplicationController

  before_filter :authenticate_user!#, :except => [:home]  
  
  load_and_authorize_resource
  
  def index
    @users = User.excludes(:id => current_user.id)
  end
  
#  def home
#    if user_signed_in?
#      redirect_to users_path
#    else
#      redirect_to users_path
#    end
#  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
  end
  
end
