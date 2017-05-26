class Task < ApplicationRecord
	belongs_to :user 
	has_many :task_categories
	has_many :categories, through: :task_categories

	validates :title, :description, :categories,  presence: true

	def categories_attributes=(category_attributes)
		category_attributes.values.each do |category_attribute|
		  if !category_attribute[:name].empty?
		    category = Category.find_or_create_by(category_attribute)
		    self.categories << category
		  end
		end
	end


end
