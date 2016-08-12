class Book < ApplicationRecord
  has_many :loan_records
  has_many :inventory_records

  validates :title, presence: true, uniqueness: true
  validates :text, presence: true, length: { minimum: 15 }
end
