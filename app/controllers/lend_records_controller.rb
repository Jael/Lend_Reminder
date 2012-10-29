class LendRecordsController < ApplicationController
  def index
    @user = current_user
    @search = @user.lend_records.search(params[:q])
    @lend_records = @search.result
    @lend_records = @lend_records.page(params[:page]).per(4)
  end
  def new
    @user = current_user
    @lend_record = LendRecord.new
  end
  def create
    @user = current_user
    @lend_record = @user.lend_records.new(params[:lend_record])
    if @lend_record.save
      redirect_to @lend_record, notice: "Successfully created the record."
    else 
      render :new
    end
  end
  def show
    @user = current_user
    @lend_record = @user.lend_records.find(params[:id])
  end
  def edit
    @user = current_user
    @lend_record = @user.lend_records.find(params[:id])
  end
  def update
    @user = current_user
    @lend_record = @user.lend_records.find(params[:id])
    if @lend_record.update_attributes(params[:lend_record])
      redirect_to @lend_record, notice: "Successfully updated the record."
    else
      render :edit
    end
  end
  def destroy
    @user = current_user 
    @lend_record = @user.lend_records.find(params[:id])
    @lend_record.destroy
    redirect_to lend_records_path, notice: "Successfully destroyed the record."
  end

  def canceled 
    @user = current_user
    @lend_record = @user.lend_records.find(params[:id])
    @lend_record.cancel_the_record
    @lend_record.save
    redirect_to lend_records_path, notice: "Successfully canceled the record!"
  end
end
