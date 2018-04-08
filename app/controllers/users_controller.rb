class  UsersController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:api_sign_in]


	def my_profile
		@user = current_user
	end


	def update
		
		current_user.update(
				email: params[:user][:email],
				avatar: params[:user][:avatar]
			)

		redirect_to action: 'my_profile'
	end

	def api_sign_in
		user = User.find_by_email(params[:username])
		
		if (user.valid_password? params[:password])
			user.set_auth_token
			return render json: user
		else
			return render json: {message: "Invalid Username or Password"}, status: 401
		end
	end






end





