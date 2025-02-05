# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProjectPolicy, type: :policy do
  subject(:policy) { described_class }

  permissions :edit?, :update? do
    let(:project) { build_stubbed(:project, user:) }
    let(:user) { build_stubbed(:user) }

    it { is_expected.to permit(user, project) }

    context "when project does not belong to user" do
      let(:project) { build_stubbed(:project) }

      it { is_expected.not_to permit(user, project) }
    end
  end
end
