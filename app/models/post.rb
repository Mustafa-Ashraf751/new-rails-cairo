class Post < ApplicationRecord
  validates :title, :content, presence: true
  
  # Post belongs to a user (author)
  belongs_to :user
  # Post belongs to a creator (alias for user)
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id', optional: true
  
  # Many-to-many with editors - fixed syntax
  has_many :post_editors, dependent: :destroy
  has_many :editors, through: :post_editors
end
