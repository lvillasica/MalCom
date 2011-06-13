# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.create(:email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password', :admin => true, :status => 'Active')
Role.create(:position => 'default',
            :can_create_project => false, :can_read_project => false, :can_update_project => false, :can_delete_project => false,
            :can_create_ticket => false, :can_read_ticket => false, :can_update_ticket => false, :can_delete_ticket => false,
            :can_create_comment => false, :can_read_comment => false, :can_delete_comment => false,
            :can_create_tag => false, :can_read_tag => false, :can_update_tag => false, :can_delete_tag => false,
            :can_add_member => false, :can_remove_member => false, :can_assign_ticket => false)
