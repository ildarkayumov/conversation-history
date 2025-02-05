# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProjectStatusChange, type: :model do
  describe "validations" do
    it { is_expected.to validate_inclusion_of(:previous_status).in_array(%w[active inactive]) }
    it { is_expected.to validate_inclusion_of(:current_status).in_array(%w[active inactive]) }
  end
end
