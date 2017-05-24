class TasksController < ApplicationController
	def index
		@tasks = current_user.tasks
	end

	def new
		@task = Task.new
	end

	def create
		current_user.tasks.build(task_params)
		current_user.save
		redirect_to tasks_path
	end

	def show
		@task = Task.find(params[:id])
	end

	private
	  def task_params
	  	params.require(:task).permit(:title, :description)
	  end
end
