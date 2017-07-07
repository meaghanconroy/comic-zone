require 'rails_helper'

feature "User signs up" do
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
  scenario 'a new user signs up' do
    @cap_marvel = cap_marvel
    @ironman = ironman
    @black_panther = black_panther
    @black_widow = black_widow
    ActionMailer::Base.deliveries.clear
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
    expect(ActionMailer::Base.deliveries.count).to eq(1)

  end
end
