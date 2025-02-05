# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_enum :projects_status, %w[active inactive]

    create_table :projects do |t|
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :name, null: false
      t.string :description
      t.enum :status, enum_type: "projects_status", null: false, default: "active"

      t.timestamps
    end
  end
end
