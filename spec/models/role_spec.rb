require 'spec_helper'

describe Role do
  before(:each) do
    @role = Role.create(:position => 'default',
                        :can_create_project => false, :can_read_project => false, :can_update_project => false, :can_delete_project => false,
                        :can_create_ticket => false, :can_read_ticket => false, :can_update_ticket => false, :can_delete_ticket => false,
                        :can_create_comment => false, :can_read_comment => false, :can_delete_comment => false,
                        :can_create_tag => false, :can_read_tag => false, :can_update_tag => false, :can_delete_tag => false,
                        :can_add_member => false, :can_remove_member => false, :can_assign_ticket => false)
  end
  
  it "should not be saved if position is empty" do
    @role.position = nil
    @role.should_not be_valid
  end
  
end
