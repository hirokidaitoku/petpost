class Post < ApplicationRecord
  belongs_to :user
  
  validates :content, length: { maximum: 200 }
  validates :content_or_image, presence: true
  
  
  mount_uploader :image, ImageUploader
  
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
  def self.search(search)
    if search
      Post.where(["content LIKE ?", "%#{search}%"])
    else
      Post.all
    end
  end
  
  private
  def content_or_image
    content.presence or image.presence
  end
  
end
