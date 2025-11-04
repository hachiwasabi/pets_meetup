class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
  has_many :tags, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 500 }
  validates :images, presence: true

  scope :by_active_users, -> { joins(:user).merge(User.active) }
  
  def self.search_by(word, match)
    case match
    when "exact"
      where(title: word)
    when "forward"
      where("title LIKE ?", "#{word}%")
    when "backward"
      where("title LIKE ?", "%#{word}")
    else
      where("title LIKE ?", "%#{word}%")
    end
  end

end
