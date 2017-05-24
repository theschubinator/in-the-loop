class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
  has_many :categories, through: :tasks

  enum role: [:user, :admin]
  after_initialize :set_default_role

  def set_default_role
  	self.role || self.role = :user
  end

end
