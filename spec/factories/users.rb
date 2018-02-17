FactoryGirl.define do
  factory :user, aliases: [:owner] do
    first_name 'Simon'
    last_name 'Fletcher'
    sequence(:email) { |n| "test-#{n}@gmail.com" }
    password 'dottle-nouveau-pavilion-tights-yyy'
  end
end
