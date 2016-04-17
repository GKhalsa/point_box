class RewardsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @rewards = Reward.all
  end
end
