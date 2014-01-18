# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_activity do
    user
    activity
  end
end
