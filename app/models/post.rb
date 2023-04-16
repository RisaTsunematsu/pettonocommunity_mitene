class Post < ApplicationRecord
   has_one_attached :post_image
   
   belongs_to :user
   has_many :likes, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :post_tag_relations, dependent: :destroy
   has_many :tags, through: :post_tag_relations, dependent: :destroy
   
  
   validates :post_image, presence: true
   validates :title,presence: true
   validates :tag,presence: true
   validates :body,presence: true,length: {maximum: 200}
  
   
  def liked_by?(user)
    if user.present? #userという変数の中身があるか確認するメソッド　
      likes.exists?(user_id: user.id)
    end
  end
  
  def get_post_image
    (post_image.attached?) ? post_image : 'no_image.jpg'
  end
end
