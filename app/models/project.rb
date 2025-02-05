# frozen_string_literal: true

class Project < ApplicationRecord
  STATUSES = {
    active: "active",
    inactive: "inactive"
  }.freeze

  enum :status, STATUSES

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :project_status_changes, dependent: :destroy

  validates :name, presence: true
end
