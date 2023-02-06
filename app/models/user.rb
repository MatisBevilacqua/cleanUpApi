class User < ApplicationRecord
  before_create :generate_token
  validates :email, uniqueness: true

  has_secure_password

  def update_average_ranking
    self.average_ranking = self.total_ranking / self.comment_count
    self.save
  end

  private
  def generate_token
    self.token = SecureRandom.hex(20)
  end
end
