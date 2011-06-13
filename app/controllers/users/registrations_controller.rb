class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create, :cancel, :edit, :update]
  skip_before_filter :require_no_authentication
  
  def edit
    @resource = User.find_by_id(params[:id])
  end
  
  def create 
    build_resource
    if resource.save
      redirect_to users_url
    end
  end
  
  def update
  end
  
  def check_permissions
    authorize! :update, resource
  end
end

