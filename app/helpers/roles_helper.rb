module RolesHelper

  def display(action)
    return "&#10004;".html_safe if eval "@role.#{action}"
    return "&#x2717;".html_safe
  end
end
