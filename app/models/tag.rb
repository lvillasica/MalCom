class Tag < ActiveRecord::Base

  belongs_to :project
  has_and_belongs_to_many :tickets
  
  before_create :testing
  before_save :check
  
  
  def testing
    puts "una ko testing"
  end
  
  def check
    Tag.find_or_create_by_label_and_project_id(self.label, self.project_id)
    puts self.inspect
  end
end
