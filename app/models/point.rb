class Point < ActiveRecord::Base
  belongs_to :user
  belongs_to :reward

  def redeemed?
    if reward_id.nil?
      "no"
    else
      "yes"
    end
  end
end
