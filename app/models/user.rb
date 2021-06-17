# has two fields email and password_digest
# bcrypt gives has_secure_password for encryption
# gives 2 additional fields password and password_confirmation

class User < ApplicationRecord
  has_secure_password
end
