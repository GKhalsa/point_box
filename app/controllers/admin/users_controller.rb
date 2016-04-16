class Admin::UsersController < Admin::BaseController

  def index
    @users = User.where(role: 0)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # if @user.save && user_params[:password] == "password1"
    #   flash[:notice] = "Welcome to Your Admin Account"
    #   @user.update(role: 1)
    #   redirect_to
    if @user.save
      flash[:notice] = "Your Account Has Been Successfully Created"
      redirect_to admin_users_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :username,
                                 :password,
                                 :password_confirmation)
  end
end
