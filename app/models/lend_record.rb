class LendRecord < ActiveRecord::Base
  attr_accessible :amount, :date, :email, :name
  def self.check_date
    LendRecord.all.each do |record|
      if record.cancel == false && record.date <= Date.today
          RemindMailer.remind_email(record).deliver
      end
    end
  end
  
  def cancel_the_record
    self.cancel = true
  end
end
