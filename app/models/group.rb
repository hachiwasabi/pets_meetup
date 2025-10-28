class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :group_members, dependent: :destroy
  has_many :members, -> { where(group_members: { status: :approved }) }, through: :group_members, source: :user
  has_many :messages, dependent: :destroy
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
end
