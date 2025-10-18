class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :group_members, dependent: :destroy
  has_many :members, -> { where(group_members: { status: :approved }) }, through: :group_members, source: :user

  validates :name, presence: true
end
