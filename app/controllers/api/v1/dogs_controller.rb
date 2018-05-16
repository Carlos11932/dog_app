class Api::V1::DogsController < ApplicationController

  include HTTParty


	def dogs_filter
		dogs = Dog.all
		breed = params[:breed]
		if(breed.present?)
			dogs = dogs.select do |dog|
				dog.breed.downcase.include?(breed.downcase)
			end
		end
		render json: dogs
	end

	def google_maps_api_query

		adress = params['direction'].gsub!(' ', '+')
		google_api_key = 'AIzaSyCco2s5skJ5_l7uB4vpIHfCYEtrJu7dE5I'

		response = HTTParty.get('https://maps.googleapis.com/maps/api/geocode/json?address='+adress+',+CA&key='+google_api_key)

		render json: response
	end
	

	def google_maps_api_get_map_query
		binding.pry
		google_api_key = 'AIzaSyCco2s5skJ5_l7uB4vpIHfCYEtrJu7dE5I'
		coord = params['coord']

		response = HTTParty.get('https://maps.googleapis.com/maps/api/staticmap?center='+coord+'&zoom=12&size=400x400&maptype=roadmap&key='+google_api_key)
		
		render json: response
	end	

end	