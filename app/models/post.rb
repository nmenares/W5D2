class Post < ApplicationRecord
  belongs_to :sub
  
  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User
  
  validates :title, :url, :content, presence: true
end 
