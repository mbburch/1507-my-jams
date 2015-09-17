class SessionsController < ApplicationController
  def new
  end

  def create
    # find the user
    @user = User.find_by(username: params[:session][:username])
    # make sure authenticated pswd matches what's in DB. If it does, set session user_id
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:errors] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end