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
	  redirect_to user_tasks_path(current_user)
	end

	def edit
	  find_task
	end

	def update
	  find_task
	  @task.update(task_params)
	  redirect_to user_task_path(current_user, @task)
	end

	def show
	  find_task
	end

	def destroy
	  find_task
	  delete_category
	  @task.destroy
	  redirect_to user_tasks_path(current_user)
	end

	private
	  def task_params
	  	params.require(:task).permit(:title, :description, category_ids: [], categories_attributes: [:name])
	  end

	  def find_task
	  	@task = Task.find(params[:id])
	  end

	  def delete_category
	  	@task.categories.each { |category| category.destroy if category.tasks.size <= 1 }
	  end

end
