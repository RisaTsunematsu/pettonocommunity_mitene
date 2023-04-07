class Post < ApplicationRecord
   has_one_attached :post_image
   belongs_to :user
   validates :post_image, presence: true
   validates :title,presence: true
   validates :tag,presence: true
   validates :body,presence: true,length: {maximum: 200}
  
   has_many :likes, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :post_tag_relations, dependent: :destroy
   has_many :tags, through: :post_tag_relations, dependent: :destroy
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
  
  def get_post_image
    (post_image.attached?) ? post_image : 'no_image.jpg'
  end
end
