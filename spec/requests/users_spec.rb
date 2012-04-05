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

      visit edit_user_password_path
    end

    it "displays settings" do
      page.should have_content("Change Password")

      page.should have_content("Change Notification Settings")
      page.html.should have_form(user_password_url, :post) do
        with_select "user[notification_frequency]" do
          with_option "Never", :selected => true # default value
          with_option "Weekly"
          with_option "Monthly"
        end
      end
    end

    it "updates password" do
      page.should have_content("Current password")
      page.should have_content("Password")
      page.should have_content("Password confirmation")
      
      fill_in "Current password", :with => 'password'
      fill_in "user_password", :with => 'new_password'
      fill_in "user_password_confirmation", :with => 'new_password'
      click_button "Change my password"
      
      page.should have_content("Password updated!")
    end

    it "updates notification settings" do
      select "Weekly", :from => "Notification frequency"
      click_button "Change my Notifications"

      page.should have_content("Notification Settings Updated")
      page.html.should have_form(user_password_url, :post) do
        with_option "Weekly", :selected => true
      end
    end
  end
end
