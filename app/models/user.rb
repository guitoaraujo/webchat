class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages
end
