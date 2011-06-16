class Comment < ActiveRecord::Base
  
  validates_presence_of :comment
  belongs_to :ticket
  belongs_to :user

  before_save :get_user

  def get_user
    @user = User.find(self.ticket_id)
    @user = @user.email
  end


end
