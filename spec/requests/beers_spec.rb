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

    it "displays beers in order of most points to least" do
      b1 = given_a_beer("Convict Hill")
      b2 = given_a_beer("Coors Lite")
      b3 = given_a_beer("Strong Bow")

      given_a_user("steve").update_attribute(:votes, [b1, b3, b2])
      given_a_user("clarice").update_attribute(:votes, [b1, b3, b2])
      given_a_user("hannibal").update_attribute(:votes, [b1, b2, b3])

      get beers_path

      response.body.should match(/Convict Hill.*Strong Bow.*Coors Lite/)
    end
  end

  describe "GET /vote" do
    it "displays the list of all beers, alphabetized" do
      given_a_beer("Strong Bow")
      given_a_beer("Convict Hill")
      given_a_beer("Coors Lite")

      given_a_logged_in_user('bob')

      get vote_path

      response.body.should match(/Beer List.*Convict Hill.*Coors Lite.*Strong Bow/)
    end
  end
end
