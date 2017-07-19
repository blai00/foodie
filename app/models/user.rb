class User < ActiveRecord::Base
has_many :recipes, dependent: :destroy

has_many :comments, dependent: :destroy
has_many :recipe_comments, through: :comments, source: :recipe



has_secure_password
EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
validates :first_name, :last_name, presence:true
validates :email, presence:true, uniqueness: {case_sensitive: false} , format: {with: EMAIL_REGEX}
validates :password, length: {minimum: 6}, on: :create
end

