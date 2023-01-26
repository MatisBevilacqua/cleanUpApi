class User < ApplicationRecord
  validates :email, uniqueness: true

  has_secure_password

  def authenticate(password)
    self.authenticate(password)
  end
end
