class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_path @user
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Your setting is updated."
      redirect_to user_path @user
    else
      render "edit"
    end
  end

  private

  def user_params
    (params.require :user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :location,
      :profile,
    )
  end
end
