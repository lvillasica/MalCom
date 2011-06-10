class Comment < ActiveRecord::Base

  belongs_to :ticket, :user

end
