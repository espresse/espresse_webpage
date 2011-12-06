class Guest < User

  	def email
  		""
  	end

  	def is_admin
  		false
  	end

	def is_admin?
		false
	end

	def is_guest?
		true
	end

	def is_user?
		false
	end
end