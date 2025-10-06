class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  scope :active, -> { where(is_active: true) }


  validates :name, presence: true, length: { maximum: 30 }
  validates :pet_type, presence: true, length: { maximum: 50 }
  validates :pet_name, presence: true, length: { maximum: 30 }
  validates :bio, presence: true, length: { maximum: 200 }

  def active_for_authentication?
    super && is_active
  end

  def inactive_message
    is_active ? super : :deleted_account
  end
  
end
