class RewardsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @rewards = Reward.all
  end

  def create
    @user = User.find(params[:user_id])
    @reward = Reward.find(params[:id])
    if @user.enough_points(@reward)
      flash[:notice] = "added a reward"
      redirect_to user_path(@user)
    else
      flash[:notice] = "you haven't got the coin lad"
      redirect_to user_rewards_path(@user)
    end
  end

end
