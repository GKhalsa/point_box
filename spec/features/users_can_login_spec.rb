require 'rails_helper'

RSpec.feature "pre existing user can login" do
  scenario "they see a welcome page" do

    User.create(name: "name",
            username: "username",
            password: "password")

     visit login_path
     fill_in "Username", with: "username"
     fill_in "Password", with: "password"

     click_on "login"
     expect(page).to have_content "Welcome name!"
  end

  context "pre existing user cannot login with wrong credentials" do
    scenario "they see login page with errors" do

      User.create(name: "name",
              username: "username",
              password: "password")

      visit login_path
      fill_in "Username", with: "username"
      fill_in "Password", with: "passwor"

      click_on "login"
      expect(page).to have_content "Invalid, try again"
    end
  end

  context "non existing user cannot login" do
    scenario "they see login page with errors" do

      visit login_path
      fill_in "Username", with: "username"
      fill_in "Password", with: "password"

      click_on "login"
      expect(page).to have_content "Invalid, try again"
    end
  end
end
