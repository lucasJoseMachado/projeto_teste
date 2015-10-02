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
        expect(response).to redirect_to action: :new
      end

      it "send feedback to generic user" do
        post :create, candidate: attributes_for(:candidate)
        pending "testar o envio de email"
      end

      it "send feedback to specialized user" do
        post :create, candidate: attributes_for(:back_end_developer)
        pending "testar o envio de email"
      end
    end
  end
end
