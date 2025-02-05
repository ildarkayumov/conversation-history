# frozen_string_literal: true

class ProjectStatusChange < ApplicationRecord
  belongs_to :project

  validates :previous_status, inclusion: { in: Project::STATUSES.values }
  validates :current_status, inclusion: { in: Project::STATUSES.values }
end
