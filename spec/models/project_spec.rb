# frozen_string_literal: true

require "rails_helper"

RSpec.describe Project, type: :model do
  subject { build(:project) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
