class Editor < ApplicationRecord
   validates :name, :email, presence: true
  validates :email, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  
  # Many-to-many with posts
  has_many :post_editors, dependent: :destroy
  has_many :posts, through: :post_editors
end
