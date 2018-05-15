Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: 'home#index'

	#user
	post 'users/sign_in', to: 'users#sign_in'

	#dogs
	get 'dogs', to: 'dogs#all_dogs', as: 'list_all_dogs'
	get 'dogs/new', to: 'dogs#new_dog', as: 'new_dog'
	get 'dogs/:id', to: 'dogs#show_dog', as: 'show_dog'
	get 'dogs/published/:id', to: 'dogs#show_my_dogs', as: 'my_dogs'
	get 'dogs/:id/edit', to: 'dogs#edit_dog', as: 'edit_dog'

	post 'dogs', to: 'dogs#create_dog', as: 'create_dog'
	delete 'dogs/:id', to: 'dogs#destroy_dog', as: 'destroy_dog'
	put 'dogs/:id', to: 'dogs#update_dog', as: 'update_dog'

	#api 
	namespace :api do
		
		namespace :v1 do

			get 'dogs', to: 'dogs#dogs_filter'
		
		end
	
	end


end
