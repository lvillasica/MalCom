class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :position
      t.boolean :can_create_project
      t.boolean :can_update_project
      t.boolean :can_delete_project
      t.boolean :can_read_project
      t.boolean :can_create_ticket
      t.boolean :can_read_ticket
      t.boolean :can_update_ticket
      t.boolean :can_delete_ticket
      t.boolean :can_create_comment
      t.boolean :can_read_comment
      t.boolean :can_delete_comment
      t.boolean :can_create_tag
      t.boolean :can_read_tag
      t.boolean :can_update_tag
      t.boolean :can_delete_tag
      t.boolean :can_add_member
      t.boolean :can_remove_member
      t.boolean :can_assign_ticket

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
