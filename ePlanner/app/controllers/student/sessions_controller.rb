class Student::SessionsController < ApplicationController
	def login
		if params[:session]
	    user = User.find_by(email: params[:session][:email].downcase, category: UserType::STUDENT)
	    if user && user.authenticate(params[:session][:password])
	    	log_in user
	      remember user
	    	redirect_to student_user_courses_path(user)
	      # Log the user in and redirect to the user's show page.
	    else
	      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      	render '/student/courses/login'
	    end
	  else
	  	render '/student/courses/login'
	  end
	end

	def signup
		if params[:user]
			@user = User.new(user_params)
			if @user.save
				flash[:success] = "Teacher User Added Successfully"
				redirect_to student_login_path
			else
				render '/student/courses/signup'
			end
		else
			@user = User.new
			render '/student/courses/signup'
		end
	end
end