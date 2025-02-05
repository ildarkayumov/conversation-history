# frozen_string_literal: true

require "rails_helper"

RSpec.describe Projects::UpdateService, type: :service do
  subject(:service) { described_class.new(project, params) }

  let(:project) { create(:project, name: "Old Name") }
  let(:params) do
    {
      name: "New Name"
    }
  end

  describe "#call" do
    it "updates project attributes" do
      expect { service.call }
        .to change { project.reload.name }
        .from("Old Name")
        .to("New Name")
    end

    it { expect(service.call).to be_truthy }

    context "when status has changed" do
      let(:params) do
        {
          status: "inactive"
        }
      end

      it "creates project status change" do
        expect { service.call }
          .to change(ProjectStatusChange, :count)
          .from(0)
          .to(1)
        expect(ProjectStatusChange.last).to have_attributes(previous_status: "active", current_status: "inactive", project:)
      end
    end

    context "with invalid params" do
      let(:params) do
        {
          name: ""
        }
      end

      it "does not update project attributes" do
        expect { service.call }.not_to change { project.reload.name }
      end

      it { expect(service.call).to be_falsey }
    end
  end
end
