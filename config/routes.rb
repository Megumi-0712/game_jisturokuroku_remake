Rails.application.routes.draw do

	root "home#top"
	get 'about' => "home#about"

#---users--
	devise_for :users
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :blogs, only: [:index, :new, :create, :show, :edit, :upadte, :destroy] do
		resources :comments, only: [:create]
	end
	resources :users, only: [:index, :show, :edit, :update]
end
