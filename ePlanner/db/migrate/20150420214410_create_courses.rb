class CreateCourses < ActiveRecord::Migration
	def change
    create_table :courses do |c|
      c.string :name
      c.string :department
      c.integer :number
      c.string :assignment_data
      c.string :course_code
    end

    change_table :assignments do |a|
    	a.belongs_to :course
    end
  end
end