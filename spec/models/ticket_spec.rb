require 'spec_helper'

describe Ticket do
  before(:each) do
    @ticket = Ticket.new( :ticket_name => 'Ticket', :ticket_description => 'This is a ticket.', :status => 'Open',
                          :priority => 'Normal', :logged_time => 2, :tracker_type => 'Bug', :assigned_to => 1, :project_id => 1, :created_by => 1)
  end
  
  it "should not be saved if ticket_name is empty" do
    @ticket.ticket_name = ""
    @ticket.should_not be_valid
  end
  
  it "should not be saved if ticket description is empty" do
    @ticket.ticket_description = ""
    @ticket.should_not be_valid
  end
  
  it "should not be saved if status is not Open Assigned In-progress Resolved or Reopened" do
    @ticket.status = "Something Else"
    @ticket.should_not be_valid
  end
  
  it "should not be saved if priority is not Minor Major Normal or Critical" do
    @ticket.priority = "Something Else"
    @ticket.should_not be_valid
  end
  
  it "should not be saved if logged time is not a number" do
    @ticket.logged_time = "log"
    @ticket.should_not be_valid
  end
  
  it "should not be saved if tracker type is not Bug or Task" do
    @ticket.tracker_type = "Something Else"
    @ticket.should_not be_valid
  end
  
end
