# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create project", type: :system do
  include_context "when user logged in"

  it "enables me to create widgets" do
    visit projects_path
    click_link "New project"

    fill_in "Name", with: "Example Project"
    fill_in "Description", with: "Example Project Description"
    click_button "Save"

    expect(page).to have_text("Project was successfully created.")
    expect(page).to have_text("Example Project")
  end
end
