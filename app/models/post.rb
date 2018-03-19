class MyValidator < ActiveModel::Validator
  def validate(post)
    clickbait = ["Won't Believe", "Secret", "Top", "Guess"]
    valid = ""
    if post.title
      clickbait.each do |word|
        if post.title.include?(word)
          break
        else
          valid = false
        end
      end
    end
    if valid == false
      post.errors[:title] << "Not Clickbait"
    end
  end
end

class Post < ActiveRecord::Base

  includes ActiveModel::Validator

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates_with MyValidator

end
