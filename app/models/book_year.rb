class BookYear < ApplicationRecord
  belongs_to :book
  belongs_to :year
end
