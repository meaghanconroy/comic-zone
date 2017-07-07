require 'rails_helper'

feature "User updates profile" do
  let!(:user) do
    FactoryGirl.create(:user)
  end
  let!(:cap_marvel) do
    FactoryGirl.create(:comic, title: "Captain Marvel (2016 - Present)")
  end
  let!(:ironman) do
    FactoryGirl.create(:comic, title: "Iron Man Annual (1970 - 1994)")
  end
  let!(:black_panther) do
    FactoryGirl.create(:comic, title: "Black Panther (2016 - Present)")
  end
  let!(:black_widow) do
    FactoryGirl.create(:comic, title: "Black Widow (2010)")
  end
  scenario 'a user can update their current profile' do
    @cap_marvel = cap_marvel
    @ironman = ironman
    @black_panther = black_panther
    @black_widow = black_widow
    visit root_path
    sign_in_as(user)
    click_link "Edit Profile"
    visit edit_user_registration_path(user)
    fill_in 'Username', with: "CaptainMarvel"
    fill_in 'First Name', with: "Carol"
    fill_in 'Last Name', with: "Danvers"
    fill_in 'Email', with: "danvers@avengers.com"
    fill_in 'Password', with: "test2test2"
    fill_in 'Password Confirmation', with: "test2test2"
    fill_in 'Current Password', with: user.password

    click_button 'Update'
    expect(page).to have_content("Update Successful!")


  end

  scenario 'a user incorrectly updates their email' do
    visit root_path
    sign_in_as(user)
    click_link "Edit Profile"
    visit edit_user_registration_path(user)
    fill_in 'Email', with: "junchacademy.com"
    fill_in 'Password', with: "test2test2"
    fill_in 'Password Confirmation', with: "test2test2"
    fill_in 'Current Password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Email is invalid')
  end

  scenario 'a user incorrectly updates their password' do
    visit root_path
    sign_in_as(user)
    click_link "Edit Profile"
    visit edit_user_registration_path(user)
    fill_in 'Password', with: "st2"
    fill_in 'Password Confirmation', with: "st2"
    fill_in 'Current Password', with: user.password

    click_button 'Update'
    expect(page).to have_content('Password is too short (minimum is 6 characters)')


  end
end
