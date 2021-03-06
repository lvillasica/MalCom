class Ticket < ActiveRecord::Base

  belongs_to :project
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  has_many :comments

  validates_presence_of :ticket_name, :ticket_description
  validates_inclusion_of :status, :in => %w(Open Assigned In-progress Resolved Reopened)
  validates_inclusion_of :priority, :in => %w(Minor Major Normal Critical)
  validates_inclusion_of :tracker_type, :in => %w(Bug Task)
  validates_numericality_of :logged_time, :allow_blank => true
  
  before_save :get_assigned
  
  def get_assigned
    assigned = User.find(self.assigned_to).email
  end
  
   def separate_tags(project_id, labels)
    separated_tags = []
    labels.split(',').each do |tag|
      separated_tags << {:label => tag.strip, :project_id => project_id}
    end
    separated_tags
  end
  
  def update_tags(labels, tags)
    # murag HUGAW code kaayo ni na part :[
    labels = labels.split(',')
    tags.each do |tag|
      if labels.empty?
        tag.destroy
      else
        tag.update_attributes(:label => labels[0].strip, :project_id => project_id)
        labels.delete_at(0)
      end
    end
    self.tags_attributes = separate_tags(project_id, labels.join(',').to_s) unless labels.empty?
  end

  def self.search(date, assigned_to, status, priority)
    #date = "" if date == Time.now.to_date
    if assigned_to.to_i.eql?(0)
    where("created_at LIKE ? and status LIKE ? and priority LIKE ?", 
         "#{date}%", "#{status}%", "#{priority}%")
    else
    where("created_at LIKE ? and assigned_to = ? and status LIKE ? and priority LIKE ?", 
         "#{date}%", assigned_to.to_i, "#{status}%", "#{priority}%") 
    end
  end
end
