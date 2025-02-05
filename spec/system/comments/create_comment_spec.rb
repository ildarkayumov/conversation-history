# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create project", type: :system do
  include_context "when user logged in"

  let(:project) { create(:project) }

  it "enables me to create widgets" do
    visit project_path(project)

    fill_in "comment_body", with: "New comment from user"
    click_button "Submit"

    expect(page).to have_text("Comment was successfully created.")
    expect(page).to have_text("New comment from user")
  end
end
