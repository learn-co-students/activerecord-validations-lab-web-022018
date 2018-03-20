class Author < ActiveRecord::Base
  validates :name, :phone_number, presence: true
  validates :name, uniqueness: true
  # validates :phone_number, numericality: {only_integer: true}
  validates :phone_number, length: {in: 10..18}
end
