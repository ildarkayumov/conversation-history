# frozen_string_literal: true

FactoryBot.define do
  factory :project_status_change do
    project
    previous_status { "active" }
    current_status { "active" }
  end
end
