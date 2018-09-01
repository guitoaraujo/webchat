module ApplicationHelper
	def ordered_users
		chatrooms = User.find(current_user.id).chatrooms
		
		users_friendly = Array.new
		
		chatrooms.each do |chatroom|
			chatroom.users.each do |user|
				users_friendly << user if user.online? && user != current_user
			end
		end
		
		users_diff = (User.all - [current_user]) - users_friendly
		(users_friendly + users_diff).uniq
	end
end
