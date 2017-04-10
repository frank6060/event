Rails.application.routes.draw do
  devise_for :users
  resources :events do
		member do
			get "like", to: "events#upvote"
			get "dislike", to: "events#downvote"
		end
		resources :comments
	end
  resources :types

	root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
