class Teacher::SessionsController < ApplicationController
	def login
		if params[:session]
	    user = User.find_by(email: params[:session][:email].downcase, category: UserType::TEACHER)
	    if user && user.authenticate(params[:session][:password])
	    	log_in user
	      remember user
	    	redirect_to teacher_user_courses_path(user)
	      # Log the user in and redirect to the user's show page.
	    else
	      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      	render '/teacher/courses/login'
	    end
	  else
	  	render '/teacher/courses/login'
	  end
	end

	def signup
		if params[:user]
			@user = User.new(user_params)
			if @user.save
				flash[:success] = "Teacher User Added Successfully"
				redirect_to teacher_login_path
			else
				render '/teacher/courses/signup'
			end
		else
			@user = User.new
			render '/teacher/courses/signup'
		end
	end
end