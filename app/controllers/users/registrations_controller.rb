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
    @resource = User.find_by_id(params[:user][:id])
    params[resource_name].delete(:password) if params[resource_name][:password].blank?
    params[resource_name].delete(:password_confirmation) if params[resource_name][:password_confirmation].blank?

    if @resource.update_attributes(params[:user])
      redirect_to users_url
    else
      clean_up_passwords(@resource)
      render_with_scope :edit
    end
  end

  def check_permissions
    authorize! :update, resource
  end
  
end

