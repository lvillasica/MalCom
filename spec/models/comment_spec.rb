require 'spec_helper'

describe Ticket do
  before(:each) do
    @comment = Comment.new(:comment => 'This is a comment!', :ticket_id => 1, :user_id => 1)
  end
  
  it "should not be saved if comment is empty" do
    @comment.comment = ""
    @comment.should_not be_valid
  end
  
end
