require "rails_helper"

RSpec.describe CandidateMailer, :type => :mailer do
  describe "developer type email" do
    before(:each) do
      @email = CandidateMailer.developer_type_email("front_end", "test@test.com")
    end

    it "send email" do
      expect{
        @email.deliver
      }.to change{ ActionMailer::Base.deliveries.count }.by(1)
    end

    it "has correct subject" do
      expect(@email.subject).to eq I18n.t("candidate_mailer.developer_type_email.subject")
    end

    it "has correct from" do
      expect(@email.from).to eq [ENV["sender_email"]]
    end
  end
end
