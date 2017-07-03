require 'rails_helper'

feature "User signs up" do
  scenario 'a new user signs up' do
    visit root_path

    click_link 'Sign Up'
    fill_in 'Username', with: "myamazingusername"
    fill_in 'First Name', with: "Hermione"
    fill_in 'Last Name', with: "Granger"
    fill_in 'Email', with: "hermionegranger@launchacademy.com"
    fill_in 'Password', with: "testtest"
    fill_in 'Password Confirmation', with: "testtest"
    attach_file 'Avatar', "#{Rails.root}/spec/support/photo.jpg"

    click_button 'Sign Up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
    expect(page).to have_css("img[src*='photo.jpg']")
  end
end
