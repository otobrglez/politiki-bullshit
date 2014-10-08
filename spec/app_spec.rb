require 'spec_helper'

RSpec.describe "App" do
  include Rack::Test::Methods
  subject(:app) { Sinatra::Application }

  context "GET /" do
    before { get '/' }
    it { expect(last_response).to be_ok }
  end

  context "GET /1-2-3-4" do
    before { get '/1-2-3-4' }
    it { expect(last_response).to be_ok }
  end

  context "GET /100-100-200-322" do
    before { get '/100-100-200-322' }
    it { expect(last_response).not_to be_ok }
  end
end
