require "rails_helper"
include TestHelpers

RSpec.feature "Admin can create rewards" do
  scenario "they see new reward with cost" do
    admin = create_admin
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit new_admin_reward_path
    fill_in "name", with: "pokemon"
    fill_in "point_cost", with: 3
    click_on "Create Reward"
    expect(current_path).to eq "/admin/rewards"
    save_and_open_page
  end
end
