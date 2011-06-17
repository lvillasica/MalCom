module TicketsHelper
  
  def show_tags
    tags = @ticket.tags
    labels = []
    tags.each do |tag|
      labels << tag.label
    end
    labels.join(', ').to_s
  end
end
