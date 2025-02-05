# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test_user_email_#{n}@example.com" }
    password { "12345678" }
  end
end
