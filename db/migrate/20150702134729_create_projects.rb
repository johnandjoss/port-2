class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.column :title, :string
    	t.column :content, :string
    	t.column :link, :string
    	t.column :skill_id, :integer

    	t.timestamps
    end
  end
end
