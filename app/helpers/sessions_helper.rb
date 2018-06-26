module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
		s = Student.find_by user_id: user.id
		if s
			session[:student_id] = s.id
			session[:registrant_id] = nil
		else
			r = Registrant.find_by user_id: user.id
			session[:student_id] = nil
			session[:registrant_id] = r.id
		end 
	end

	def log_out
  		session.delete(:user_id)
  		@current_user = nil
  	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def current_student_id
		session[:student_id]
	end

	def current_registrant_id
		session[:registrant_id]
	end

	def logged_in?
		!current_user.nil?
	end

	def is_teacher?
		!session[:registrant_id].nil?
	end

	def is_student?
		!session[:student_id].nil?
	end
end
