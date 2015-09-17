require 'rails_helper'

feature 'logged in admin sees categories index' do
  scenario 'with valid attributes' do

    admin = User.create(username: "admin", password: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path
    save_and_open_page

    expect(page).to have_content("All Categories")
  end
end

feature 'default user does not see admin categories index' do
  scenario 'with invalid attributes' do

  user = User.create(username: "default_user", password: "password", role: 0)

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit admin_categories_path

  expect(page).to_not have_content("All Categories")
  expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
