require "rails_helper"

feature "User deletes profile" do
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
  scenario "A user can delete their profile" do
    @cap_marvel = cap_marvel
    @ironman = ironman
    @black_panther = black_panther
    @black_widow = black_widow
    visit root_path
    sign_in_as(user)
    click_link 'Edit Profile'
    visit edit_user_registration_path(user)
    click_button 'Cancel My Account'
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We're sorry to see you go!")
  end
end
