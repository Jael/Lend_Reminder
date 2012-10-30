# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authentication, :class => 'Authentications' do
    provider "MyString"
    uid "MyString"
    user_id 1
  end
end
