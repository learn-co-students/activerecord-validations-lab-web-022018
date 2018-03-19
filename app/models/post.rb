class PostValidator < ActiveModel::Validator
  def validate(post)
    @click_bait = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    if !post.title.nil?
      unless @click_bait.any? {|phrase| post.title.include?(phrase)}
        post.errors[:title] << "No clickbait!"
      end
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates_with PostValidator
end
