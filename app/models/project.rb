class Project < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :tickets
  has_many :tags
  
  validates_presence_of :project_name, :description
  validates_inclusion_of :status, :in => %w(Active Status)
  
end
