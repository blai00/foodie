class Recipe < ActiveRecord::Base
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :user_comments, through: :comments, source: :user
  
  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user
  
  validates :name, :description, :instructions, presence: true
  validates :user_id, presence:true, on: :create
  
  
end
