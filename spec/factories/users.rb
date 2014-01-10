# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Bob'
    last_name 'Smith'
    height 70
    weight 200
    gender 'Male'
    date_of_birth '11/12/2003'
    sequence(:email) { |n| "person#{n}@example.com" }
    age 33
    password '343343343433'
  end
end
