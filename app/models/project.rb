class Project < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :tickets
  has_many :tags, :through => :tickets
  
  validates_presence_of :project_name, :project_description
  
end
