class User < ActiveRecord::Base

  has_secure_password

  validates :email,           presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :first_name,      presence: true
  validates :last_name,       presence: true

end
