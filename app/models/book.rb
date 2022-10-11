class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  validates :title, :rating, :reviews, :price, presence: true,
  validates :title, uniqueness: true,
  validates :rating, numericality: true,
  validates :reviews, :price, numericality: {only_integer: true}
end
