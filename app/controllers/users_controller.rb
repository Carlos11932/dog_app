class UsersController < ApplicationController

	# before_action :check_log_in, unless: [:sign_in] 

	def sign_in 
		user = user_params
		users = User.where('name = ?', user['user_name'])
		if users.length == 0
			redirect_to root_path and return
		end
		session[:current_user_name] = users.first.id
		redirect_to list_all_dogs_path
	end

	# def sign_up
	# 	redirect_to action 'dog#dogs', id: 2
	# end

	private

		def check_log_in
			if !session[:current_user_name]
				redirect_to root and return
			end
		end

		def user_params
			params.require(:user).permit(:user_name).to_hash
		end

end
