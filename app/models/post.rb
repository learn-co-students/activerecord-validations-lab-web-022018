class MyValidator < ActiveModel::Validator
  def validate(record)
    out = true
    if record.title == nil
      record.errors[:title] << "Title must exist"
    else
      clickbait = ["Won't Believe", "Secret", "Top","Guess"]
      clickbait.each do |c|
        if record.title.include?(c)
          out = false
        end
      end
      record.errors[:title] << 'Not clickbaity enough!' if out
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
end
