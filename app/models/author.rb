class Author < ApplicationRecord
  has_many :books

  # paginates_per 25

  validates :name, presence: true, uniqueness: true
end
