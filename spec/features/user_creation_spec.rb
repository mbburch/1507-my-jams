require "rails_helper"

feature "User creates a new account" do
  scenario "with valid attributes" do

    visit root_path
    expect(current_path).to eq("/")
    click_link "Sign Up"
    expect(current_path).to eq(new_user_path)
    fill_in "Username", with: "MB"
    fill_in "Password", with: "secret"
    click_on "Submit"

    within(".header") do
      expect(page).to have_content("Welcome, MB!")
    end
  end
end