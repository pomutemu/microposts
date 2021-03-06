class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def logged_in_user
    if not logged_in?
      store_location
      flash[:danger] = "Please log in."

      redirect_to login_path
    end
  end

  def correct_user
    @user = User.find params[:id]

    if not @user == current_user
      redirect_to root_url
    end
  end
end
