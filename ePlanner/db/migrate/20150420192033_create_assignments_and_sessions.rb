class CreateAssignmentsAndSessions < ActiveRecord::Migration
	def change
    create_table :assignments do |a|
      a.string :name
      a.string :category
      a.date :due_date
    end
		
    create_table :sessions do |t|
      t.string :session_id, :null => false
      t.text :data
      t.timestamps
    end

    add_index :sessions, :session_id, :unique => true
    add_index :sessions, :updated_at
  end
end