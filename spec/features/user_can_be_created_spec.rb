require "rails_helper"

RSpec.feature "Admin can create a user" do
  scenario "they should see a list of users" do

    admin = User.create(name: "name",
                    username: "username",
             password_digest: "password",
                        role: 1
                       )

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_user_path
    fill_in "name", with: "namee"
    fill_in "username", with: "usernamee"
    fill_in "password", with: "password"
    fill_in "password_confirmation", with: "password"

    click_on "Create User"
    expect(page).to have_content "namee"
  end
end

RSpec.feature "Regular users can't create a new user" do
  scenario "they see a 404 page" do
    user = User.create(name: "name",
                   username: "username",
            password_digest: "password")

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit new_admin_user_path

    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
