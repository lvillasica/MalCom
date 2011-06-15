module TicketsHelper
  
  def show_tags
    tags = Tag.find(:all, :conditions => ['ticket_id = ?', @ticket.id])
    labels = []
    tags.each do |tag|
      labels << tag.label
    end
    labels.join(', ').to_s
  end
end
