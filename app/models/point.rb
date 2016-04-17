class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward

  def redeemed?
    reward_id.nil? ? "no" : "yes"
  end
end
