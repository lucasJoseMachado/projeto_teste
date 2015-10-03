require 'rails_helper'

describe "candidates/new.html.haml" do
  it "displays candidate basic infos if candidate is defined" do
    candidate = build(:candidate)
    assign(:candidate, candidate)
    render
    expect(rendered).to include(candidate.name)
    expect(rendered).to include(candidate.email)
  end
end
