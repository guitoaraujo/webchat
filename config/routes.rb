Rails.application.routes.draw do
  devise_for :users
  
  resources :chatrooms do
	  resource :chatroom_users
	  resources :messages
  end
  
  get 'chatroom_users/user_chat_create'
  
  mount ActionCable.server => '/cable'
	
  root 'chatrooms#index'
end
