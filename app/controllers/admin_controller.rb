class AdminController < ActionController::Base
	layout 'application'

	def users
		@users = User.where(role: "user")
	end

	def user_show
		@user = User.find(params[:user_id])
	end

	
end