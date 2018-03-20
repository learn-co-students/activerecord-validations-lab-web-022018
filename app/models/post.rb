class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless (value =~ /Won't Believe/ ||
        value =~ /Secret/ ||
        value =~ /Top [0-9]+/ ||
        value =~ /Guess/)
      record.errors[attribute] << (options[:message] || "not clickbaity enough")
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true, clickbait: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
end
