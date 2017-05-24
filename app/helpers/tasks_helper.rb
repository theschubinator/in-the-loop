module TasksHelper
	def task_categories(task)
		task.categories.collect { |category| category.name }.join(", ")
	end
end
