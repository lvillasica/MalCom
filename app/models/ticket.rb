class Ticket < ActiveRecord::Base

  belongs_to :project
  #has_many :comments
  #has_many_and_belongs_to :tags

end
