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
  scenario 'a user can view their profile' do
    @cap_marvel = cap_marvel
    @ironman = ironman
    @black_panther = black_panther
    @black_widow = black_widow
    visit root_path
    sign_in_as(user)
    click_link "View Profile"
    visit user_path(user)
    expect(page).to have_content "#{user.username}'s Homepage"
    expect(page).to have_content "Welcome, #{user.first_name}"
  end
end
