module SessionsHelper
  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def logged_in?
    current_user ? true : false
  end

  def store_location
    if request.get?
      session[:forwarding_url] = request.url
    end
  end
end
