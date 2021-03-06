class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password]) && @user.role == "admin"
      session[:user_id] = @user.id
      redirect_to admin_users_path
    elsif @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Invalid, try again"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
