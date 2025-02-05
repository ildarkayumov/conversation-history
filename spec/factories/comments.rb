# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    project
    user
    body { "Some example comment" }
  end
end
