class User < ApplicationRecord
  has_many :comments
  validates :email, uniqueness: true

  has_secure_password

  before_create :generate_token

  private
  def generate_token
    self.token = SecureRandom.hex(20)
  end
end
