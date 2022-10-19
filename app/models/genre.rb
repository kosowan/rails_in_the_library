class Genre < ApplicationRecord
  has_many :books

  # paginates_per 5
  # validates :name, presence: true, uniqueness: true
end
