class Recipe < ActiveRecord::Base
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :user_comments, through: :comments, source: :user
  
  has_many :likes, dependent: :destroy
  has_many :user_likes, through: :likes, source: :user
  
  has_many :ingredients
  has_many :directions
  
  accepts_nested_attributes_for :ingredients,
                                reject_if: proc {|attributes| attributes['name'].blank?},
                                allow_destroy: true
  accepts_nested_attributes_for :directions,
                                reject_if: proc{|attributes| attributes['steps'].blank?},
                                allow_destroy: true
                                
  
  validates :name, :description, :image, presence: true
  validates :user_id, presence:true, on: :create
  
  has_attached_file :image, :styles => {:medium => '400x400'}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  
end
