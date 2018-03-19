
class ClickbaitValidator < ActiveModel::Validator
  def validate(record)
    # unless record.name.starts_with? 'X'
    #   record.errors[:name] << 'Need a name starting with X please!'
    # end #unless
    # if record
    # if record[:title] && record[:title].include?("Won't Believe")
      # true
    # end #if
    # unless !record[:title] || !record[:title].include?("Won't Believe")
    unless  record[:title] && record[:title].include?("Won't Believe")
      # true
      record.errors[:title] << 'Need clickbait plz'
    end #unless
  end #validate
end #class

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with ClickbaitValidator
  validates :title, presence: true#, uniqueness: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: %w(Fiction Non-Fiction)#%w(male female)
  # validates :title, inclusion: %w("Won't Believe Secret Top [number] Guess )

end

#
# class ClickbaitValidator < ActiveModel::Validator
#   def validate(record)
#     unless record.name.starts_with? 'X'
#       record.errors[:name] << 'Need a name starting with X please!'
#     end
#   end
# end
#
# class Person
#   include ActiveModel::Validations
#   validates_with MyValidator
# end
