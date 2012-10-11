require 'spec_helper'

describe LendRecord do
  describe '.check_date' do
    before do
      ActionMailer::Base.delivery_method = :test
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.deliveries = []

      LendRecord.create(name: 'aaa', email: 'test@mail.com', amount: 10, date: Date.yesterday)
      LendRecord.create(name: 'bbb', email: 'test@mail.com', amount: 10, date: Date.today)
      LendRecord.create(name: 'ccc', email: 'test@mail.com', amount: 10, date: Date.tomorrow)

      LendRecord.check_date
    end

    it "should send mail" do
      ActionMailer::Base.deliveries.size.should == 2
    end
  end
end
