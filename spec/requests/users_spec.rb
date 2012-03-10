require 'spec_helper'

describe "Users" do
  before(:each) do
    given_a_user("steve")
  end

  it "authenticates" do
    visit '/users/sign_in'
    fill_in "Email", :with => 'steve@gmail.com'
    fill_in "Password", :with => 'password'
    click_button "Sign in"
    page.should have_content("Signed in successfully")
  end

  describe "GET /users/password/edit" do
    before(:each) do
      visit '/users/sign_in'
      fill_in "Email", :with => 'steve@gmail.com'
      fill_in "Password", :with => 'password'
      click_button "Sign in"
    end

    it "displays settings" do
      visit edit_user_password_path

      page.should have_content("Change Password")
    end

    it "updates password" do
      visit edit_user_password_path
      page.should have_content("Current password")
      page.should have_content("Password")
      page.should have_content("Password confirmation")
      
      fill_in "Current password", :with => 'password'
      fill_in "user_password", :with => 'new_password'
      fill_in "user_password_confirmation", :with => 'new_password'
      click_button "Change my password"

      page.should have_content("Password updated!")
    end
  end
end
