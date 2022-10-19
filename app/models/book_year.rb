class BookYear < ApplicationRecord
  belongs_to :book
  belongs_to :year

  validates :book, presence: true
  validates :year, presence: true
end
