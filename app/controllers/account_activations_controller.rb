class AccountActivationsController < ApplicationController

	def edit
		user = User.find_by(email: params[:email])
		if user && !user.activated? && user.authenticated?(:activation, params[:id])
			user.activate
			log_in user
			flash[:success] = "Activation Complete"
			redirect_to user
		else
			flash[:danger] = "Invalid Activation"
			redirect_to root_url
		end
	end

end 

#test comment
#test comment 2
#test comment 3
#test comment 4
