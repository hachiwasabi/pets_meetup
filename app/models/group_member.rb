class GroupMember < ApplicationRecord
  belongs_to :user
  belongs_to :group

  scope :active_user, -> { joins(:user).where(users: { is_active: true }) }

  enum status: { pending: 0, approved: 1, rejected: 2 }
end
