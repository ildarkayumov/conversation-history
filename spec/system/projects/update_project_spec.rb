# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Update project", type: :system do
  include_context "when user logged in"

  before do
    create(:project, name: "Old Project", user:)
  end

  it "enables me to create widgets" do
    visit projects_path
    click_link "Edit", match: :first

    fill_in "Name", with: "Updated Project"
    fill_in "Description", with: "Updated Project Description"
    select "inactive", from: "Status"
    click_button "Save"

    expect(page).to have_text("Project was successfully updated.")
    expect(page).to have_text("Updated Project")
    expect(page).to have_text("Updated Project Description")
    expect(page).to have_text("inactive")
  end
end
