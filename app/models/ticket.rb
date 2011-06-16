class Ticket < ActiveRecord::Base

  belongs_to :project
  has_many :tags
  accepts_nested_attributes_for :tags

  has_many :comments
  
  #validates_presence_of :ticket_name, :ticket_description
  #validates_inclusion_of :status, :in => %w(Open, Assigned, In-progress, Resolved, Reopened)
  #validates_inclusion_of :priority, :in => %w(Minor, Major, Normal, Critical)
  #validates_numericality_of :logged_time
  
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

  def self.search(date, assigned_to, status, priority)
    date = "" if date == "Click to pick date..."
    status = "" if status == "Status"
    priority = "" if priority == "Priority"
    if assigned_to.to_i.eql?(0)
    find(:all, :conditions => ["created_at LIKE ? and status LIKE ? and priority LIKE ?", 
         "#{date}%", "#{status}%", "#{priority}%"])
    else
    find(:all, :conditions => ["created_at LIKE ? and assigned_to = ? and status LIKE ? and priority LIKE ?", 
         "#{date}%", assigned_to.to_i, "#{status}%", "#{priority}%"]) 
    end
  end

end
