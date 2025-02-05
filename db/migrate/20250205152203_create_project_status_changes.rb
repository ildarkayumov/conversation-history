# frozen_string_literal: true

class CreateProjectStatusChanges < ActiveRecord::Migration[8.0]
  def change
    create_table :project_status_changes do |t|
      t.belongs_to :project, null: false, foreign_key: { on_delete: :cascade }
      t.string :previous_status
      t.string :current_status

      t.timestamps
    end
  end
end
