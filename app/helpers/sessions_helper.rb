module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
	end

	def log_out
  		session.delete(:user_id)
  		@current_user = nil
  	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end

	def is_teacher?
		@is_teacher ||= Registrant.find_by(user_id: session[:user_id])
	end

	def is_student?
		@is_teacher ||= Student.find_by(user_id: session[:user_id])
	end
end
