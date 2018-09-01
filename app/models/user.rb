class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages, dependent: :destroy
  
  validates :email, :name, uniqueness: true

  def online?
    updated_at > 10.minutes.ago
  end
end
