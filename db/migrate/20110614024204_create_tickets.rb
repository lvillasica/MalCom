class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :ticket_name
      t.text :ticket_description
      t.string :status
      t.string :priority
      t.integer :assigned_to
      t.time :logged_time
      t.integer :created_by
      t.string :tracker_type
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
