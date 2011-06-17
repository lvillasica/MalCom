class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :label
      t.integer :project_id

      t.timestamps
    end
    
    create_table :tags_tickets, :id => false do |t|
      t.integer :tag_id
      t.integer :ticket_id
    end 
  end

  def self.down
    drop_table :tags
  end
end
