class Recipe < ActiveRecord::Base
  
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :user_comments, through: :comments, source: :user
  
  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user
  
  validates :name, :description, presence: true
  validates :user_id, presence:true, on: :create
  
  has_attached_file :image, :styles => {:medium => '400x400'}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
end
