class TasksController < ApplicationController
	def index
	  @tasks = current_user.tasks
	end

	def new
	  @task = Task.new
	end

	def create
	  current_user.tasks.build(task_params)
	  current_user.tasks.last.categories << Category.create(category_params)
	  current_user.save
	  redirect_to tasks_path
	end

	def edit
	  find_task
	end

	def update
	  find_task
	  @task.update(task_params)
	  @task.categories << Category.create(category_params)
	  redirect_to task_path(@task)
	end

	def show
	  find_task
	end

	def destroy
	  find_task
	  @task.destroy
	  redirect_to tasks_path
	end

	private
	  def task_params
	  	params.require(:task).permit(:title, :description, category_ids: [])
	  end

	  def category_params
	  	params.require(:categories).permit(:name)
	  end

	  def find_task
	  	@task = Task.find(params[:id])
	  end
end
