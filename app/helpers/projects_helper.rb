module ProjectsHelper

  def display_name
    current_user.username.blank? ? current_user.email : current_user.username
  end
  
  def tickets_sum(status)
    @project.tickets.find(:all, :conditions => ['status = ?', status.humanize ]).count
  end
  
  def total_logtimes
    tickets = @project.tickets.find(:all)
    logtimes = 0
    tickets.each { |ticket| logtimes += ticket.logged_time}
    logtimes
  end
end
