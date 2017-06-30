require 'rails_helper'

feature "User signs in" do
  let(:user) do
    FactoryGirl.create(:user)
  end

  scenario "successful sign out" do
    visit root_path
    sign_in_as(user)
    click_link "Sign Out"

    expect(page).to have_content "Come back soon!"
  end
end
