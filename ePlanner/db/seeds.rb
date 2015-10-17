# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_teacher = User.create(name: 'Professor Newman', email: 'mikenewman3@gmail.com', 
	password: 'mikeman', password_confirmation: 'mikeman', category: UserType::TEACHER)

biology_101 = Course.create(name: 'Introduction to Biology', department: 'BIOL', number: 101,
	assignment_data: "[{\"assignment\":\"Exam #1\",\"due_date\":\"1991-10-01\",\"type\":\"Exam\"}]",
	course_code: "bio101")
chem_101 = Course.create(name: 'Introduction to Chemistry', department: 'CHEM', number: 101,
	assignment_data: "[{\"assignment\":\"Homework #1\",\"due_date\":\"1991-10-01\",\"type\":\"HW\"},{\"assignment\":\"Exam #1\",\"due_date\":\"1992-12-23\",\"type\":\"Exam\"},{\"assignment\":\"Quiz #1\",\"due_date\":\"1993-08-12\",\"type\":\"Quiz\"}]",
	course_code: "chem101")

user_teacher.courses.push(biology_101)
user_teacher.courses.push(chem_101)

user_student = User.create(name: 'Michael Newman', email: 'mikenewman4@gmail.com', 
	password: 'mikeman', password_confirmation: 'mikeman', category: UserType::STUDENT)

user_student.courses.push(chem_101)


User.create(name: 'Professor Newman', email: 'mikenewman3@gmail.com', password: 'mikeman', password_confirmation: 'mikeman', category: UserType::TEACHER)

