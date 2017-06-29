require "rails_helper"

feature "Admin views a list of users" do
  let!(:admin) do
    User.create(username: "shehulk", first_name: "Jennifer", last_name: "Walters", email: "jwalters@lawfirm.com", password: "password", password_confirmation: "password",
    admin: true)
  end
  let!(:user) do
    FactoryGirl.create(:user)
  end
  let!(:user2) do
    User.create(
      username: "jsonofspartax",
      first_name: "J'Son",
      last_name: "Spartax",
      email: "starlordsdad@launchacademy.com",
      password: "testtest",
      password_confirmation: "testtest",
    )
  end
  scenario "an admin can view all users" do
    visit root_path
    sign_in_as(admin)
    click_link 'View Users'
    visit admin_users_path
    expect(page).to have_content("jsonofspartax")
    expect(page).to have_content("J'Son Spartax")
  end
  scenario "an non-admin cannot view all users" do
    visit root_path
    sign_in_as(user)
    expect(page).to_not have_content("View Users")
  end
end
