class Student::CoursesController < ApplicationController
	before_action :require_login

	def index
		flash[:change_failed] = ""
		flash[:change_successfully] = ""
		@user = User.find_by_id(params[:user_id])
		@course_links = @user.courses.collect{|course| [course.name, (url_for id: course.id)]}
		@course = Course.new

		return unless params[:id].present?

		current_course = Course.find_by_id(params[:id])
		return unless current_course.present?

		@course_data = ActiveSupport::JSON.decode(current_course.assignment_data)
	end

	def create
		@user = User.find_by_id(params[:user_id])
		new_course = Course.find_by_course_code(params[:course][:course_code])
		if new_course
			if (@user.courses.find_by_id(new_course.id))
				flash[:change_failed] = "Already enrolled in course"
			else
				@user.courses.push(new_course)
				flash[:changed_successfully] = new_course.name+" Added Successfully"
				flash[:change_failed] = ""
			end
		else
			flash[:change_failed] = "Invalid Code"
		end
		@course_links = @user.courses.collect{|course| [course.name, (url_for id: course.id)]}
		@course = Course.new
		render('index')
	end

	private

		def require_login
			redirect_to student_login_path unless current_user and current_user.category == UserType::STUDENT
		end
end
