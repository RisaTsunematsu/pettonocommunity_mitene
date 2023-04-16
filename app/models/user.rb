class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :handlename, presence: true
  validates :introduction, length: { maximum: 50}
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
    
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def self.guest
    find_or_create_by!(email: 'guest@mail.com') do |user|
      user.first_name = "山田"
      user.last_name = "太郎"
      user.first_name_kana = "ヤマダ"
      user.last_name_kana = "タロウ"
      user.handlename = "guest"
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
  end
  
  
end
