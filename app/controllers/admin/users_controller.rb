class Admin::UsersController < Admin::BaseController

  def index
    @users = User.where(role: 0)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Your Account Has Been Successfully Created"
      redirect_to admin_users_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    binding.pry
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have Successfully updated #{@user.name}"
      redirect_to admin_user_path(@user)
    else
      flash.now[:error] = "Please try again"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    flash[:notice] = "You have terminated #{@user.name}"
    @user.points.destroy_all
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :username,
                                 :password,
                                 :password_confirmation,
                                 :role)
  end
end
