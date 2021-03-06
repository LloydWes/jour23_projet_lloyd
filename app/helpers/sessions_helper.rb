module SessionsHelper
  def current_user
    if session['user_id']
      User.find_by(id: session[:user_id])
    else
      User.new(id: -1)
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end
end
