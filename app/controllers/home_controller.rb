class HomeController < ApplicationController
	def index
	 redirect_to user_tasks_path(current_user) if signed_in? 
	end
end