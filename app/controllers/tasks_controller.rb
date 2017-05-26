class TasksController < ApplicationController
	def index
	  @tasks = current_user.tasks.where(completed: 0)
	end

	def new
	  @task = Task.new
	end

	def create
	  @task = current_user.tasks.build(task_params)

	  if @task.save
	    redirect_to user_tasks_path(current_user)
	  else
	  	flash[:alert] = @task.errors.full_messages.join(" & ")
	  	render 'new'
	  end
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
	  	params.require(:task).permit(:title, :completed, :description, category_ids: [], categories_attributes: [:name])
	  end

	  def find_task
	  	@task = Task.find(params[:id])
	  end

	  def delete_category
	  #	binding.pry
	  	@task.categories.each { |category| category.destroy if category.tasks.size <= 1 }
	  end

end
