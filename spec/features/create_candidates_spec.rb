require 'rails_helper'

RSpec.feature "Create candidates", type: :feature do
  before(:each) do
    @candidate = build(:candidate)
  end

  scenario "create valid user", js: true do
    visit "/candidates/new"
    fill_in "candidate_name", with: @candidate.name
    fill_in "candidate_email", with: @candidate.email
    click_button "confirm_button"
    expect(page).to have_text I18n.t("candidate.create_success")
  end

  scenario "dont create invalid user", js: true do
    visit "/candidates/new"
    fill_in "candidate_name", with: @candidate.name
    click_button "confirm_button"
    expect(page).to have_text I18n.t("candidate.create_error")
  end
end
