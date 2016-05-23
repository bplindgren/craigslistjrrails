class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :is_owner?, :is_user?

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def is_owner?
    unless @post.seller_id == session[:user_id]
      redirect_to categories_path
    end
  end

  def is_user?
    if session[:user_id]
    end
  end


end
