Rails.application.routes.draw do
  devise_for :users
  resources :posts do
		member do
			get "like", to: "posts#upvote"
			get "dislike", to: "post#downvote"
		end
		resources :comments
	end

	root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
