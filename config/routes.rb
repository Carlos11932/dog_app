Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'home#index'

	post 'users/sign_in', to: 'users#sign_in'
	# post 'users/sign_up', to: 'users#sign_up' 
	get 'dogs', to: 'dogs#all_dogs', as: 'list_all_dogs'
	get 'dogs/new', to: 'dogs#new_dog', as: 'new_dog'
	get 'dogs/:id', to: 'dogs#show_dog', as: 'show_dog'
	get 'dogs/published/:id', to: 'dogs#show_my_dogs', as: 'my_dogs'
	get 'dogs/:id/edit', to: 'dogs#edit_dog', as: 'edit_dog'

	post 'dogs/create_dog', to: 'dogs#create_dog'
	post 'dogs/destroy_dog', to: 'dogs#destoy_dog'
end
