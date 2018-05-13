Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'home#index'

	post 'users/sign_in', to: 'users#sign_in'
	# post 'users/sign_up', to: 'users#sign_up' 
	get 'dogs', to: 'dogs#all_dogs', as: 'list_all_dogs'
end
