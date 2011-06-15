class Tag < ActiveRecord::Base

#  has_many_and_belongs_to :tickets
  belongs_to :project
  belongs_to :ticket
  
  #before_save :remove_duplicate
end
