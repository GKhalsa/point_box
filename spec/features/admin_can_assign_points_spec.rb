require 'rails_helper'
include TestHelpers

RSpec.feature "Admin can assign points" do
  scenario "they see an updated point total" do

    admin = create_admin
    user  = create_user
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_users_path
    click_on "Jenny"

    # expect(page).to have_content 0
    click_on "add point"
    click_on "create point"


    # save_and_open_page
    expect(current_path).to eq admin_user_path(user)
    expect(page).to have_content 1
  end
end
