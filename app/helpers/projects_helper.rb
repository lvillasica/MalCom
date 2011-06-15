module ProjectsHelper

  def display_name
    current_user.username.blank? ? current_user.email : current_user.username
  end
end
