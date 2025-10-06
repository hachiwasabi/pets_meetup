class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 30 }
  validates :pet_type, presence: true, length: { maximum: 50 }
  validates :pet_name, presence: true, length: { maximum: 30 }
  validates :bio, presence: true, length: { maximum: 200 }
  
end
