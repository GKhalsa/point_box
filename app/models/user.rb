class User < ActiveRecord::Base
  has_secure_password
  has_many :points
  has_many :rewards, through: :points

  enum role: %w(default admin)

  def total_points
    points.sum(:point)
  end
end
