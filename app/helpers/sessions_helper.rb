module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
		session[:student_id] = nil
		session[:registrant_id] = nil
		session[:teacher_id] = nil
		s = Student.find_by user_id: session[:user_id]
		if !s.nil?
			session[:student_id] = s.id
		else
			r = Registrant.find_by user_id: user.id
			if !r.nil?
				session[:registrant_id] = r.id
				t = Teacher.find_by registrant_id: r.id
				if !t.nil?
					session[:teacher_id] = t.id
				end
			end
		end 
	end

	def log_out
  		session.delete(:user_id)
  		session.delete(:student_id)
  		session.delete(:registrant_id)
  		session.delete(:teacher_id)
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

	def current_teacher_id
		session[:teacher_id]
	end

	def logged_in?
		!current_user.nil?
	end

	def is_teacher?
		!session[:teacher_id].nil?
	end

	def is_student?
		!session[:student_id].nil?
	end
end
