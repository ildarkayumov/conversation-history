# frozen_string_literal: true

class Project < ApplicationRecord
  STATUSES = {
    active: "active",
    inactive: "inactive"
  }.freeze

  enum :status, STATUSES

  belongs_to :user

  validates :name, presence: true
end
