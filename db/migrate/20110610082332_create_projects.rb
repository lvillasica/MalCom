class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :project_name
      t.text :project_description
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
