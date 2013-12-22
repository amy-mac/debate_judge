module SessionsHelper

  def sign_in(user)
    session[:user_id] = user.id
    # calls the current_user method below
    current_user = user
  end

  def signed_in?
    !!current_user
  end

  def signed_in_user
    unless signed_in?
      session[:return_to] = request.url
      # redirect_to new_session_path, notice: "Please sign in to see this page"
    end
  end

  def sign_out
    @current_user = nil
    reset_session
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= begin
      User.find(session[:user_id]) rescue nil
    end
  end

end
