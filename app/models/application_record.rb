class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def u
  	binding.pry
  end
end
