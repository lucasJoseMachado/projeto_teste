require 'rails_helper'

RSpec.describe Candidate, :type => :model do
  it "create a instace" do
    candidate = Candidate.new
    expect(candidate).to be_instance_of Candidate
  end

  it "factory create a valid instance" do
    candidate = build(:candidate)
    expect(candidate).to be_valid
  end

  it "validate presence of name and email" do
    candidate = Candidate.new
    expect(candidate).not_to be_valid
  end

  it "validate format of email" do
    candidate = build(:candidate, email: "invalid")
    expect(candidate).not_to be_valid
  end

  it "initialize specific fields in params" do
    candidate = Candidate.new({"name" => "test", "email" => "test@test.com", "html" => 5})
    expect(candidate.name).to eq "test"
    expect(candidate.email).to eq "test@test.com"
    expect(candidate.html).to eq 5
  end

  it "sanitize params in initialize" do
    candidate = Candidate.new({"haskell" => -5})
    expect(candidate.respond_to? :haskell).to be false
  end
end
