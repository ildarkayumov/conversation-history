# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id
  end
end
