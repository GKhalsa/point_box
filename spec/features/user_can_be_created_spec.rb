require "rails_helper"

RSpec.feature "Admin can create a user" do
  scenario "they should see a list of users" do
    visit new_admin_user_path

    fill_in "name", with: "name"
    fill_in "username", with: "username"
    fill_in "password", with: "password"
    fill_in "password_confirmation", with: "password"

    click_on "Create User"
    expect(page).to have_content "name"
  end
end

# RSpec.feature "Regular users can't create a new user" do
#   scenario "they see a 404 page" do
#     user = User.create(name: "name",
#                    username: "username",
#             password_digest: "password")
#
#     ApplicationController.any_instance.stubs(:current_user).returns(user)
#
#     visit new_admin_user_path
#
#     expect(current_path).to eq '/404'
#     expect(page).to have_content "The page you were looking for doesn't exist."
#   end
# end


















# RSpec.feature "User can create a playlist" do
#   scenario "they see the page for the individual playlist" do
#     song_one, song_two, song_three = create_list(:song, 3)
#
#     playlist_name = "My Jams"
#
#     visit playlists_path
#     click_on "New playlist"
#     fill_in "playlist_name", with: playlist_name
#     check("song-#{song_one.id}")
#     check("song-#{song_three.id}")
#
#     click_on "Create Playlist"
#     expect(page).to have_content playlist_name
#
#     within("li:first") do
#       expect(page).to have_link song_one.title, href: song_path(song_one)
#     end
#
#     within("li:last") do
#       expect(page).to have_link song_three.title, href: song_path(song_three)
#     end
#   end
# end
