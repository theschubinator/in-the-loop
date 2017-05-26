class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
	end

	def update
		current_user = User.find(params[:id])
		current_user.role = user_params[:role].to_i
		current_user.save
		redirect_to user_path(current_user)
	end

	private
	  def user_params
	  	params.require(:user).permit(:role)
	  end
end