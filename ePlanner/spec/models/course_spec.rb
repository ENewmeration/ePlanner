require 'rails_helper'

describe Course, type: :model do
	it 'is not valid without department' do
		expect(FactoryGirl.build(:course, name: "Name", number: 101,
															assignment_data: "[{\"assignment\":\"Exam #1\",\"due_date\":\"1991-10-01\",\"type\":\"Exam\"}]",
															course_code: "bio101")).not_to be_valid
	end

	it 'is not valid without number' do
		expect(FactoryGirl.build(:course, name: "Name", department: 'BIOL', 
															assignment_data: "[{\"assignment\":\"Exam #1\",\"due_date\":\"1991-10-01\",\"type\":\"Exam\"}]",
															course_code: "bio101")).not_to be_valid
	end

	it 'is not valid without assignment_data' do
		expect(FactoryGirl.build(:course, name: "Name", department: 'BIOL', number: 101,
															course_code: "bio101")).not_to be_valid
	end

	it 'is not valid without course_code' do
		expect(FactoryGirl.build(:course, name: "Name", department: 'BIOL', number: 101,
															assignment_data: "[{\"assignment\":\"Exam #1\",\"due_date\":\"1991-10-01\",\"type\":\"Exam\"}]"
														)).not_to be_valid
	end

	it 'is valid with name, department, number, assignment_data, course_code' do
		expect(FactoryGirl.build(:course, name: "Name", department: 'BIOL', number: 101,
	assignment_data: "[{\"assignment\":\"Exam #1\",\"due_date\":\"1991-10-01\",\"type\":\"Exam\"}]",
	course_code: "bio101")).to be_valid
	end
end