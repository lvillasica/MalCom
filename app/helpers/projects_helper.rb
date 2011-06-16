module ProjectsHelper

  def display_name
    current_user.username.blank? ? current_user.email : current_user.username
  end
  
  def tickets_sum(status)
    Ticket.find(:all, :conditions => ['status = ?', status.humanize ]).count
  end
end
