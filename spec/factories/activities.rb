# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    name "Activity"
    met 1.5
    cardiovascular false
    bone_strength false
    resistance false
  end
end
