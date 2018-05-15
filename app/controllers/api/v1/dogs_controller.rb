class Api::V1::DogsController < ApplicationController

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

end	