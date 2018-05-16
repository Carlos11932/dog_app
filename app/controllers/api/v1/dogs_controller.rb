class Api::V1::DogsController < ApplicationController

  include HTTParty


	def dogs_filter
		dogs = Dog.where(adopter_id: nil)
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
	


end	