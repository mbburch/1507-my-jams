require "rails_helper"

feature "registered user can logout" do
  scenario "with valid attributes" do

    user = User.create(username: "MB", password: "secret")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "secret"
    click_button "Login"

    expect(page).to have_content("Welcome, MB!")

    click_link "Logout"

    expect(page).to_not have_content("Welcome, MB!")

  end
end