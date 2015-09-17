require "rails_helper"

feature "User creates a song" do
  scenario "with valid attributes" do
    visit new_song_path
    fill_in "song[title]", with: "Hot Tubbin'"
    fill_in "song[artist]", with: "Clarence & the Machine'"
    click_on "Create Song"
    expect(current_path).to eq(songs_path)
    expect(page).to have_content("Hot Tubbin'")
  end
end