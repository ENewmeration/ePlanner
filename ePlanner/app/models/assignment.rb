class Assignment < ActiveRecord::Base
	belongs_to :course
	
	validates :name, presence: true, uniqueness: true
	validates_inclusion_of :category, in: AssignmentType.types
	validates :due_date, presence: true
end