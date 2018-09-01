module UsersHelper

	def owner_check(user)
		current_user.id == user.id || user.id == 1
	end

end
