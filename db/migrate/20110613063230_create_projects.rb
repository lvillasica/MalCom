class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :project_name
      t.text :description
      t.string :status

      t.timestamps
    end
    
    create_table :projects_users, :id => false do |t|
      t.integer :user_id
      t.integer :project_id
    end
    
    add_index(:projects_users, [:user_id, :project_id])
  end
  

  def self.down
    drop_table :projects
  end
end
