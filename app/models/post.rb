class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 500 }

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
