module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
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
    cookies.delete(:remember_token)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user || User.find_by_remember_token(cookies[:remember_token])
  end

end
