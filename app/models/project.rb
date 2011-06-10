class Project < ActiveRecord::Base
  
  has_many_and_belongs_to :users
  has-many :tickets, :tags

end
