class TasksController < ApplicationController
	def index
		@tasks = current_user.tasks
	end

	def show
	end
end
