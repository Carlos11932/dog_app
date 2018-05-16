class DogsController < ApplicationController

	before_action :check_log_in

	def all_dogs 
		@dogs = Dog.where(adopter_id: nil)
	end

	def show_dog
		@dog = Dog.find(params['id'])
		@publisher = User.find(@dog.publisher_id)
		google_api_key = 'AIzaSyCco2s5skJ5_l7uB4vpIHfCYEtrJu7dE5I'
		@dog_map_url = "https://maps.googleapis.com/maps/api/staticmap?center=" + @dog.location_lat.to_s + "," + @dog.location_lng.to_s + "&zoom=13&size=400x400&maptype=roadmap&key=" + google_api_key
	end

	def show_my_dogs
		@user = User.find(params['id'])
		@dogs = Dog.where(publisher_id: params['id'])
	end

	def new_dog
		@breeds = Dog.distinct.pluck(:breed)
	end

	def create_dog
		@dog = Dog.new(dog_params)
		@dog.image.attach(params[:dog][:image])
		@dog.publisher_id = session[:current_user_name]
    		if @dog.save
      			flash[:success] = "Nuevo miembro en el equipo"
      			redirect_to my_dogs_path(session[:current_user_name])
    		else
      			redirect_to list_all_dogs_path
      		end	
	end

	def edit_dog
		@dog = Dog.find(params['id'])
		@breeds = Dog.distinct.pluck(:breed)
	end

	def update_dog
		@dog = Dog.find(params[:id])
		@dog.image.attach(params[:dog][:image])
	    if @dog.update_attributes(dog_params)
	      flash[:success] = "Perfil de #{@dog.name} actualizado"
      		redirect_to my_dogs_path(session[:current_user_name])
	    else
      		redirect_to my_dogs_path(session[:current_user_name])
	    end
	end

	def destroy_dog
		@dog = Dog.find(params[:id])
    	@dog.destroy
    	redirect_to my_dogs_path(session[:current_user_name]), :notice => "Perfil eliminado"
	end

	def adopt_dog
		dog = Dog.find(params[:id])
		dog.adopter_id = session[:current_user_name]
		dog.save
		redirect_to my_dogs_path(session[:current_user_name])
	end

	private

		def check_log_in
			if !session[:current_user_name]
				redirect_to 'home#index'
			end
		end

		def dog_params
    	  params.require(:dog).permit(:name, :birth_date, :breed,
                                   :gender, :location_lat, :location_lng,
                                   :description, :adopter_id, :publisher_id)
    	end

end
