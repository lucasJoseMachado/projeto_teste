require 'rails_helper'

RSpec.describe EvaluateCandidate, :type => :model do

  it "correct evaluate each candidate specialization" do
    %w(front_end back_end mobile).each do |candidate_type|
      candidate = build("#{candidate_type}_developer".to_sym)
      evaluate_candidate = EvaluateCandidate.new candidate
      expect(evaluate_candidate.send("#{candidate_type}_developer?")).to be true
      expect(evaluate_candidate.send("generic_developer?")).to be false
    end
  end

  it "evaluate candidate without specializations as generic" do
    evaluate_candidate = EvaluateCandidate.new build(:candidate)
    expect(evaluate_candidate.send("generic_developer?")).to be true
  end

  describe "send feedback by type" do
    it "send to user email" do
      candidate = build(:candidate)
      evaluate_candidate = EvaluateCandidate.new candidate
      evaluate_candidate.send_feedback
      expect(ActionMailer::Base.deliveries.first.to).to eq [candidate.email]
    end

    it "send just one feedback to a generic developer" do
      evaluate_candidate = EvaluateCandidate.new build(:candidate)
      evaluate_candidate.send_feedback
      pending "testar o envio de email"
    end

    it "just one feedback to a 'one-specialization' developer" do
      evaluate_candidate = EvaluateCandidate.new build(:front_end_developer)
      evaluate_candidate.send_feedback
      pending "testar o envio de email"
    end

    it "send multiples feedbacks to a 'multi-specialization' developer" do
      evaluate_candidate = EvaluateCandidate.new build(:multi_specialization_developer)
      expect{evaluate_candidate.send_feedback}.to change { ActionMailer::Base.deliveries.count }.by(2)
    end
  end
end
