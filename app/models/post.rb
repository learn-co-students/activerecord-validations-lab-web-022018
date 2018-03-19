class MyValidator < ActiveModel::Validator
	def validate(record)
		unless !record.title || record.title.include?("Won't Believe") || record.title.include?("Top") || record.title.include?("Guess") || record.title.include?("Secret")
			record.errors[:name] << "Title isn't good enough"
		end
	end
end

class Post < ActiveRecord::Base
	
	
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
	include ActiveModel::Validations
	validates_with MyValidator
end


