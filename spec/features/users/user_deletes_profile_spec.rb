require "rails_helper"

feature "User deletes profile" do
  let!(:user) do
    FactoryGirl.create(:user)
  end
  scenario "A user can delete their profile" do
    visit root_path
    sign_in_as(user)
    click_link 'Edit Profile'
    visit edit_user_registration_path(user)
    click_button 'Cancel My Account'
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We're sorry to see you go!")
  end
end
