class UsersController < ApplicationController
  skip_before_filter :authorize
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user
      redirect_to lend_records_path,notice: "fjdkafda"
    else
      flash.now.alert = "hh"
      render :new
    end
  end


end
