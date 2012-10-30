class LendRecord < ActiveRecord::Base
  attr_accessible :amount, :date, :email, :name
  belongs_to :user
  def self.to_csv(options={})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |record|
        csv << record.attributes.values_at(*column_names)
      end
    end
  end
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
