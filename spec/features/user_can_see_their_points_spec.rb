require "rails_helper"
include TestHelpers

RSpec.feature "User can visit dashboard" do
  scenario "they will see their points" do
    user = create_user
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    user.points.create
    user.points.create
    visit user_path(user)
    expect(page).to have_content "2"
  end

  context "user can see rewards" do
    scenario "they can see how much they cost" do

      user = create_user
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      Reward.create(name:"magic cards", point_cost: 2)

      visit user_path(user)
      click_on "Possible Rewards"
      expect(current_path).to eq "/users/#{user.id}/rewards"
      expect(page).to have_content "magic cards"
    end
  end

  context "user can buy rewards" do
    scenario "they will see their purchased reward" do
      user = create_user
      user.points.create
      user.points.create
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      Reward.create(name:"magic cards", point_cost: 2)

      visit user_path(user)
      expect(page).to have_content 2
      expect(page).not_to have_content 0
      click_on "Possible Rewards"
      click_on "BUY"
      expect(current_path).to eq user_path(user)
      expect(page).to have_content 0
      expect(page).not_to have_content 2
      expect(page).to have_content "magic cards"      
    end
  end
end
