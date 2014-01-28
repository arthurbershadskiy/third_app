class SessionsController < ApplicationController
def create
	user = User.find_by(email: params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password])
	  sign_in user
		redirect_to user
		flash[:success] = 'Welcome'
	else
		flash.now[:error] = 'Invalid username or password'
		render 'new'
	end
end
def destroy
	sign_out
	redirect_to root_url
end
end
