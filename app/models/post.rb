class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 200 }
  
  mount_uploader :image, ImageUploader
  
  has_many :reverses_of_like, class_name: "Like"
  has_many :liked_user, through: :reverses_of_like, source: :user
  
end
