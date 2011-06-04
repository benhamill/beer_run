require 'spec_helper'

describe "Beers" do
  describe "GET /beers" do
    it "displays a list of beers" do
      given_a_beer("Convict Hill")
      given_a_beer("Coors Lite")
      given_a_beer("Strong Bow")

      get beers_path

      response.body.should include("Convict Hill")
      response.body.should include("Coors Lite")
      response.body.should include("Strong Bow")
    end
  end

  def given_a_beer(name)
    Beer.create :name => name
  end
end
