module UsersHelper
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  def authorized?(user)
    logged_in? && user.id == current_user.id
  end
end
