class Teacher::CoursesController < ApplicationController
	before_action :require_login

	def index
		@user = User.find_by_id(params[:user_id])
		@courses = @user.courses
		flash[:changed_successfully] = ''
		flash[:change_failed] = ''
		@course = Course.new
	end

	def new
		@course = Course.new
		flash[:changed_successfully] = ''
		flash[:change_failed] = ''
	end

	def create
		@user = User.find_by_id(params[:user_id])
		@course = Course.new(course_params)
		@course.user = @user
		if @course.save
			flash[:changed_successfully] = @course.name+" Added Successfully"
			flash[:change_failed] = ''
			@courses = Course.all
			render('index')
		else
			render('new')
		end
	end

	def edit
		@course = Course.find_by_id(params[:course_to][:edit])
	end

	def change
		@course = Course.find_by_id(params[:course_to][:edit])
		render('edit')
	end

	def update
		@course = Course.find_by_id(params[:course][:id])
		Course.update(@course.id, name: params[:course][:name], department: params[:course][:department], 
									number: params[:course][:number].to_i, assignment_data: params[:course][:assignment_data])
		@courses = Course.all
		render('index')
	end

	def remove
		course = Course.find_by_id(params[:course_to][:delete])
		if course && course.destroy
			flash[:changed_successfully] = 'Course Deleted Successfully'
			flash[:change_failed] = ''
		else
			flash[:change_failed] = 'Course Not Deleted'
			flash[:changed_successfully] = ''
		end
		@courses = Course.all
		render('index')
	end

	private

		def course_params
			params.require(:course).permit(:name, :department, :number, :assignment_data) 
		end

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :category) 
		end

		def require_login
			redirect_to teacher_login_path unless current_user and current_user.category == UserType::TEACHER
		end
end
