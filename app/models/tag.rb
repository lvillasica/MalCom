class Tag < ActiveRecord::Base

  belongs_to :project
  belongs_to :ticket
  #has_and_belongs_to_many :tickets, :join_table => "tags"

end
