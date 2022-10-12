class Year < ApplicationRecord
  validates :year, presence: true, uniqueness: true, numericality: {only_integer: true}
end
