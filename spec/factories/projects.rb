# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    user
    sequence(:name) { |n| "Example project ##{n}" }
  end
end
