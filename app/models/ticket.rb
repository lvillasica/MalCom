class Ticket < ActiveRecord::Base

  belongs_to :project
  has_many :tags
  accepts_nested_attributes_for :tags
  #belongs_to :tags
  #belongs_to :tags
  #has_and_belongs_to_many :tags
  #has_many :comments
  #has_many_and_belongs_to :tags
  
  before_save :get_assigned
  
  def get_assigned
    assigned = User.find(self.assigned_to).email
  end
  
  def separate_tags(project_id, labels)
    separated_tags = []
    labels.split(',').each do |tag|
      separated_tags << {:project_id => project_id, :label => tag.strip}
    end
    separated_tags
  end
  
  
  def update_tags(labels, tags)
    # murag hard code kaayo ni na part :[
    labels = labels.split(',')
    tags.each do |tag|
      if labels.empty?
        tag.destroy
      else
        tag.update_attributes(:label => labels[0].strip, :project_id => self.project_id, :ticket_id => self.id)
        labels.delete_at(0)
      end
    end
    self.tags_attributes = separate_tags(self.project_id, labels.join(',').to_s) unless labels.empty?
  end

end
