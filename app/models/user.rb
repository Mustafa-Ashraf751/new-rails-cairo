class User < ApplicationRecord
  validates :name,:dob,:email,:phone_number,:address,presence:true
  validates :email , format:{with:URI::MailTo::EMAIL_REGEXP,message:"must be a valid email address"}
  validates :email,uniqueness:true

  #User has many posts
  has_many :posts, dependent: :destroy
  #User as creator 
  has_many :created_posts, class_name:'Post', foreign_key: 'user_id'
  
end
