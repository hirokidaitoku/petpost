class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, length: { maximum: 200 }
  validates :content_or_image, presence: true
  
  
  mount_uploader :image, ImageUploader
  
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
  
  private
  def content_or_image
    content.presence or image.presence
  end
  
  def date
    if created_at.value = NULL ; 0
    else created_at.value 
    end
  end
  
end
