FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User_#{n}"}
    gender 'male'
    sequence(:email) { |n| "user_#{n}@email.dev"}
  end
end