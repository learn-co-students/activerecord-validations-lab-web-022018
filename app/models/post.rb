
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :title_is_click_bait

def title_is_click_bait
arr = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
  if arr.none?{|pattern| pattern.match(title)}
  errors.add(:title, "Not Clickbait")
  end

end

end
