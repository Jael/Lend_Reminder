class SessionsController < ApplicationController
  skip_before_filter :authorize
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me] 
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to lend_records_path, notice: "Successfully log in!"
    else
      flash.now.alert = "Invalid email or password!"
      render :new
    end
  end
  
  def destroy
    cookies.delete(:auth_token)
    redirect_to new_session_path, notice: "Successfully log out!"
  end
end
