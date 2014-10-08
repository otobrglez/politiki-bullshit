require 'spec_helper'

RSpec.describe "App" do
  include Rack::Test::Methods
  subject(:app) { Sinatra::Application }


  context "Website" do
    context "GET /" do
      before { get '/' }
      it { expect(last_response).to be_ok }
    end

    context "GET /1-2-3-4" do
      before { get '/1-2-3-4' }
      it { expect(last_response).to be_ok }
    end

    context "GET /100-100-200-322" do
      it { expect { get '/100-100-200-322' }.to raise_error Bullshit::NoBullshit }
    end
  end

  context "API" do
    context "/GET /api/shit.json" do
      before { get '/api/shit.json' }
      it { expect(last_response).to be_ok }
    end

    context "/GET /api/shits/1-1-1-1.json" do
      before { get '/api/shits/1-1-1-1.json' }
      it { expect(last_response).to be_ok }
    end
  end
end
