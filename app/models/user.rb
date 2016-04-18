class User < ActiveRecord::Base
  has_secure_password
  has_many :points
  has_many :rewards, through: :points

  enum role: %w(default admin)

  def total_points
    points.where(reward_id: nil).count
  end

  def enough_points(reward)
    if total_points >= reward.point_cost
      points.where(reward_id: nil).limit(reward.point_cost).update_all(reward_id: reward.id)
    else
      false
    end
  end

  def used_points
    points.where.not(reward_id: nil).count
  end
end
