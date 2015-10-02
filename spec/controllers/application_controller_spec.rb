require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do
  controller do
    def index
      render nothing: true
    end
  end
  
  it "set locale to pt" do
    get :index
    expect(I18n.locale).to eq :pt
  end
end
