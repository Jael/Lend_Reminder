class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user
      redirect_to user_lend_records_path(@user),notice: "fjdkafda"
      binding.pry
    else
      flash.now.alert = "hh"
      render :new
    end
  end


end
