require 'rails_helper'

RSpec.describe CandidatesController, :type => :controller do
  describe "get new" do
    it "set candidate instance" do
      get :new
      expect(assigns(:candidate)).to be_instance_of Candidate
    end

    it "set candidate instance without fields" do
      get :new
      expect(assigns(:candidate).to_json).to eq "{}"
    end

    it "set a invalid instance" do
      get :new
      expect(assigns(:candidate)).not_to be_valid
    end
  end

  describe "post create" do
    describe "with invalid params" do
      it "fail without any field" do
        post :create
      end

      it "fail without any name" do
        post :create, attributes_for(:candidate).merge(name: nil)
      end

      it "fail without any name" do
        post :create, {email: "test@test.com"}
      end

      after(:each) do
        expect(response).to render_template :new
      end
    end

    describe "with valid params" do
      it "redirect_to new on success" do
        post :create, candidate: attributes_for(:candidate)
        expect(response).to redirect_to(action: :new)
      end

      it "send feedback to generic user" do
        post :create, candidate: attributes_for(:candidate)
        front_end = I18n.t("candidate.developer_type.front_end")
        back_end = I18n.t("candidate.developer_type.back_end")
        mobile = I18n.t("candidate.developer_type.mobile")
        expect(ActionMailer::Base.deliveries.last.body.raw_source).not_to match /\s#{front_end}|#{back_end}|#{mobile}\s/
      end

      it "send feedback to specialized user" do
        post :create, candidate: attributes_for(:back_end_developer)
        expect(ActionMailer::Base.deliveries.last.body.raw_source).to match /#{I18n.t("candidate.developer_type.back_end")}/
      end
    end
  end
end
