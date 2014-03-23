require 'spec_helper'

describe StaticPagesController do

  describe "GET 'Help'" do
    it "returns http success" do
      get 'help'
      response.should be_success
    end
  end

  describe "GET 'Contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'Pricing'" do
    it "returns http success" do
      get 'pricing'
      response.should be_success
    end
  end

  describe "GET 'About'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

end
