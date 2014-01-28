class UsersController < ApplicationController
  def new
		@user = User.new
  end
	def show
		@user = User.find(params[:id])
	end

  def create
	  @user = User.new(user_params)
	  if @user.save
			flash[:success] = "Welcome to the App!"
		  redirect_to @user
	  else
			flash.now[:fail] = "You failed at signing up, good job."
		  render 'new'
	  end
  end
  def index
		redirect_to root_path
  end
  private

  def user_params
	  params.require(:user).permit(:name, :email, :password,
	                               :password_confirmation)
  end


end

