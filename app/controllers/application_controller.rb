class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
      if session[:user_id].nil?
          nil
      else
          User.find(session[:user_id])
      end
  end

  def ensure_that_signed_in
      redirect_to signin_path, notice:'you should be signed in' if current_user.nil?
  end
end
