class Tag < ActiveRecord::Base

  belongs_to :project
  has_and_belongs_to_many :tickets
#  
#  before_create :bef_create
#  
#  def bef_create
#    Tag.find_or_create_by_label_and_project_id(:label => label, :project_id => project_id)
#  end

end
