class Admin::PointsController < Admin::BaseController

  def new
    @user = User.find(params[:id])
    @point = Point.new
  end

  def create
    @user = User.find(params[:id])
    if @user.points.create
      flash[:notice] = "Added point for #{@user.name}"
      redirect_to admin_user_path(@user)
    else
      flash.now[:error] = "Try Again"
      render :new
    end
  end

  private


end
