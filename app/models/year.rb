class Year < ApplicationRecord
  validates :year, presence: true, uniqueness: true, numericality: {only_integer: true}

  has_many :book_years
  has_many :books, through: :book_years
end
