class Group < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :group_members, dependent: :destroy
  has_many :members, -> { where(group_members: { status: :approved }) }, through: :group_members, source: :user
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end
