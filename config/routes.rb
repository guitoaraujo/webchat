Rails.application.routes.draw do
  devise_for :users
  
  resources :chatrooms do
	  resource :chatroom_users
	  resources :messages
  end

  mount ActionCable.server => '/cable'
	
  root 'chatrooms#index'
end
