class CategoriesController < ApplicationController
	def new
		binding.pry
      @category = Category.new
	end

	def create
	  @category = Category.create(category_params)
	  redirect_to new_task_path
	end

	private
	  def category_params
	  	params.require(:category).permit(:name)
	  end
end
