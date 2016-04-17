class Admin::RewardsController < Admin::BaseController

  def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:notice] = "You have just created a new reward"
      redirect_to admin_rewards_path
    else
      flash.now[:error] = "Please try again"
      render :new
    end
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    if @reward.update(reward_params)
      flash[:notice] = "You have just updated #{@reward.name}"
      redirect_to admin_rewards_path
    else
      flash.now[:error] = "Please try again"
      render :edit
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy
    flash[:notice] = "The #{@reward.name} reward has just been deleted"
    redirect_to admin_rewards_path
  end


  private

  def reward_params
    params.require(:reward).permit(:name,
                                   :point_cost)
  end
end
