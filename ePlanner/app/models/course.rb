class Course < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	validates :department, presence: true
	validates :number, numericality: {only_integer: true}, presence: true
	validates :assignment_data, presence: true
	validates :course_code, presence: true, uniqueness: true

	has_many :assignments
	has_one :template
	has_and_belongs_to_many :users
end