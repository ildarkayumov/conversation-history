# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#render_turbo_stream_flash_messages" do
    it "returns a turbo stream update tag" do
      expect(helper.render_turbo_stream_flash_messages)
        .to eq(%(<turbo-stream action="update" target="flash"><template></template></turbo-stream>))
    end
  end

  describe "#tailwind_classes_for" do
    subject { helper.tailwind_classes_for(flash_type) }

    let(:flash_type) { :notice }

    it { is_expected.to eq("bg-green-400 border-l-4 border-green-700 text-white") }

    context "when the flash type is alert" do
      let(:flash_type) { :alert }

      it { is_expected.to eq("bg-red-400 border-l-4 border-red-700 text-white") }
    end

    context "when the flash type is missing" do
      let(:flash_type) { :success }

      it { is_expected.to eq("success") }
    end
  end
end
