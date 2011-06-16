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
  
  def unlock
    @user.clear_lock
    if @user.update_attributes(@user)
      flash[:unlock_notice] = "#{@user.email}'s lock status reset!"
    else
      flash[:unlock_error] = "#{@user.email}'s lock status not reset!"
    end
  end
  
  private
  
  def get_user
    @user = User.find(params[:id])
  end
  
end
