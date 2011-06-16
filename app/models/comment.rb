class Comment < ActiveRecord::Base

  belongs_to :ticket, :user
  
  validates_presence_of :comment

end
