class RemindMailer < ActionMailer::Base
  default from: "from@example.com"
  def remind_email(record)
    @record = record

    mail to: @record.email, subject: 'This is the system alter.'
  end
end
