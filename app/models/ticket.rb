class Ticket < ActiveRecord::Base

  belongs_to :project
  belongs_to :ticket
  #has_many :comments
  #has_many_and_belongs_to :tags
  before_save :get_assigned
  
  def get_assigned
    assigned = User.find(self.assigned_to).email
  end

end
