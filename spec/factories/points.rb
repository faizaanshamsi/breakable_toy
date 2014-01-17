# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :point do
    quantity 1
    user_id 1
    team_id 1
    accomplishment_id 1
  end
end
