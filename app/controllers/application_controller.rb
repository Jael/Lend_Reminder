class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  helper_method :current_user


 private 
  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

 def authorize
   redirect_to log_in_path, notice: "Please log in or sign up!" if current_user.nil?
 end
end
