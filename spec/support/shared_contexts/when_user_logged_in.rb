# frozen_string_literal: true

RSpec.shared_context "when user logged in" do
  let(:user) { create(:user) }

  before do
    login_as user
  end
end
