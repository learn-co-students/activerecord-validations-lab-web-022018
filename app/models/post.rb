class TitleValidator < ActiveModel::Validator
  def validate(record)
    if record.title
      unless record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top [number]") || record.title.include?("Guess")
        record.errors[:title] << "title error"
      end
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, :content, :summary, :category, presence: true
  validates_with TitleValidator
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  # private
  #
  # def valid_title
  #   unless :title.include?("Won't Believe") || :title.include?("Secret") || :title.include?("Top [number]") || :title.include?("Guess")
  #     return false
  #   end
  # end

end
