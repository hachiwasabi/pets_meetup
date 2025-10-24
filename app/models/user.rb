class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :owned_groups, class_name: "Group", foreign_key: "owner_id"
  has_many :group_members
  has_many :groups, through: :group_members
  has_one_attached :profile_image

  scope :active, -> { where(is_active: true) }


  validates :name, presence: true, length: { maximum: 30 }
  validates :pet_type, presence: true, length: { maximum: 50 }
  validates :pet_name, presence: true, length: { maximum: 30 }
  validates :bio, presence: true, length: { maximum: 200 }
  validates :profile_image, presence: true

  def active_for_authentication?
    super && is_active
  end

  def inactive_message
    is_active ? super : :deleted_account
  end
  
  def self.search_by(word, match)
    case match
    when "exact"
      where(name: word)
    when "forward"
      where("name LIKE ?", "#{word}%")
    when "backward"
      where("name LIKE ?", "%#{word}")
    else
      where("name LIKE ?", "%#{word}%")
    end
  end

  
end
