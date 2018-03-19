class Author < ActiveRecord::Base
  
  
  
  
  validates :name, presence: true # THAT IT EXISTS
  validates :name, uniqueness: true # THAT ITS UNIQUE
  validates :phone_number, length: {is: 10} 
 
end
