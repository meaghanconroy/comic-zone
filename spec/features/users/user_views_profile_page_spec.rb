require 'rails_helper'

feature "User updates profile" do
  let!(:user) do
    FactoryGirl.create(:user)
  end
  scenario 'a user can view their profile' do
    visit root_path
    sign_in_as(user)
    click_link "View Profile"
    visit user_path(user)
    expect(page).to have_content "#{user.username}'s Homepage"
    expect(page).to have_content "Welcome, #{user.first_name}"
  end
end
