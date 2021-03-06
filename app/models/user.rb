# has two fields email and password_digest
# bcrypt gives has_secure_password for encryption
# gives 2 additional fields password and password_confirmation

class User < ApplicationRecord
  has_secure_password
  has_many :twitter_accounts
  has_many :tweets

  validates :email, presence: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }
   # presence validation add null false to migration
  validates :password_digest, presence: true
end
