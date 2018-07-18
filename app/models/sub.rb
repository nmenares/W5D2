class Sub < ApplicationRecord
  belongs_to :moderator,
  foreign_key: :user_id,
  class_name: :User 
  
  has_many :posts
  
  validates :title, :description, presence: true
    
end
