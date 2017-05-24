class Category < ApplicationRecord
	has_many :users, through: :tasks
	has_many :task_categories
	has_many :tasks, through: :task_categories
end
