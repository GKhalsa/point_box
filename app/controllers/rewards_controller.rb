class RewardsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @rewards = Reward.all
  end

  def create
    @user = User.find(params[:user_id])
    @user.rewards.create(reward_params)
  end

  private
  
end
