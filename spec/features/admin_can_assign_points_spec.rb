# require 'rails_helper'
# include TestHelpers
#
# RSpec.feature "Admin can assign points" do
#   scenario "they see an updated point total" do
#
#     admin = create_admin
#     user  = create_user
#     ApplicationController.any_instance.stubs(:current_user).returns(admin)
#
#     visit admin_users_path
#     click_on "Jenny"
#
#     expect(page).to have_content 0
#     click_on "add point"
#     expect(page).to have_content 1
#   end
# end
