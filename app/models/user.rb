class User < ApplicationRecord
  has_secure_password
  has_many :loan_records

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: {case_sensitive: false}, presence: true, format: {
    with:    REGEXP[:email],
    message: 'should have proper format.'
  }
  validates :password, length: { minimum: 6 }

end
