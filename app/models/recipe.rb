class Recipe < ActiveRecord::Base
  belongs_to :user
  
  validates :name, :description, :instructions, presence: true
  validates :user_id, presence:true, on: :create
  
end
