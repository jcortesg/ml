require_relative "../spec_helper"
require_relative "../../app"

describe "app" do
  def app; Xmen::App end

  describe "GET '/'" do
    it "says welcome" do
      get "/"
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)).to eq({"message" => "Welcome! X-men"})
    end
  end
end
