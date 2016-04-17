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
  end

  context "admin can edit rewards" do
    scenario "they see updated reward" do
      admin = create_admin
      create_reward
      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit admin_rewards_path
      expect(page).to have_content "pokemon"
      click_on "Edit"
      fill_in "name", with: "magic cards"
      fill_in "point_cost", with: 2
      click_on "Update"
      expect(page).not_to have_content "pokemon"
      expect(page).to have_content "magic cards"
    end
  end

  context "admin can delete rewards" do
    scenario "they see updated list minus the reward" do
      admin = create_admin
      create_reward
      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit admin_rewards_path
      expect(page).to have_content "pokemon"
      click_on "Delete"
      expect(page).to have_content "The pokemon reward has just been deleted"
    end
  end
end
