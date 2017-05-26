class UsersController < ApplicationController
	def show
		@user = current_user
	end

	def update
		current_user.role = user_params[:role].to_i
		current_user.save
		redirect_to user_path(current_user)
	end

	private
	  def user_params
	  	params.require(:user).permit(:role)
	  end
end