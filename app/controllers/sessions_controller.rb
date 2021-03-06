class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by email: params[:session][:email].downcase

    if @user && (@user.authenticate params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "Logged in as #{@user.name}."

      redirect_to user_path @user
    else
      flash[:danger] = "Invalid email/password combination."

      render "new"
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path
  end
end
