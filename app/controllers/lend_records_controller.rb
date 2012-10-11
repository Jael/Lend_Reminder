class LendRecordsController < ApplicationController
  def index
    @lend_records = LendRecord.all
  end
  def new
    @lend_record = LendRecord.new
  end
  def create
    @lend_record = LendRecord.new(params[:lend_record])
    if @lend_record.save
      redirect_to @lend_record, notice: "Successfully created the record."
    else 
      render :new
    end
  end
  def show
    @lend_record = LendRecord.find(params[:id])
  end
  def edit
    @lend_record = LendRecord.find(params[:id])
  end
  def update
    @lend_record = LendRecord.find(params[:id])
    if @lend_record.update_attributes(params[:lend_record])
      redirect_to @lend_record, notice: "Successfully updated the record."
    else
      render :edit
    end
  end
  def destroy
    @lend_record = LendRecord.find(params[:id])
    @lend_record.destroy
    redirect_to lend_records_path, notice: "Successfully destroyed the record."
  end

  def remind
    LendRecord.check_date
    render :index
  end
end
