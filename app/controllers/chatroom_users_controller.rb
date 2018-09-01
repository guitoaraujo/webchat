class ChatroomUsersController < ApplicationController
	before_action :set_chatroom, except: :user_chat_create
	
	def create
		@chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
		redirect_to @chatroom
	end
	
	def destroy
		@chatroom_user = @chatroom.chatroom_users.where(user_id: current_user.id).destroy_all
		redirect_to chatrooms_path
	end
	
	def user_chat_create
		user_chat(params[:user])
		redirect_to @user_chatroom
	end
	
	private
	
		def set_chatroom
			@chatroom = Chatroom.find(params[:chatroom_id])
		end
	
		def user_chat(user_id)
			user     = User.find(user_id)
			@user_chatroom = Chatroom.find_or_create_by(name: "#{current_user.name} - #{user.name}")
			@user_chatroom.chatroom_users.where(user_id: current_user.id).first_or_create
			@user_chatroom.chatroom_users.where(user_id: user.id).first_or_create
		end
end