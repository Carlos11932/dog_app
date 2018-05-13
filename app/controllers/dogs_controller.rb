class DogsController < ApplicationController

	before_action :check_log_in

	def all_dogs 
		@dogs = Dog.where.not(adopter_id: nil)
	end

	private

		def check_log_in
			if !session[:current_user_name]
				redirect_to 'home#index'
			end
		end
end
