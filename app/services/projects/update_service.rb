# frozen_string_literal: true

module Projects
  class UpdateService
    private attr_reader :project, :params

    def initialize(project, params)
      @project = project
      @params = params
    end

    def call
      project.assign_attributes(params)
      store_project_status_change
      project.save
    end

    private

    def store_project_status_change
      return unless project.status_changed?

      project.project_status_changes.build(previous_status: project.status_was, current_status: project.status)
    end
  end
end
