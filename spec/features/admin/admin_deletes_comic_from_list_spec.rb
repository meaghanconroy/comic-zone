require "rails_helper"

feature "Admin deletes a comic" do
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
  let!(:comic) do
    FactoryGirl.create(:comic)
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
  scenario "an admin can delete a comic" do

    @cap_marvel = cap_marvel
    @ironman = ironman
    @black_panther = black_panther
    @black_widow = black_widow
    visit root_path
    sign_in_as(admin)
    click_link "Update Comics"
    visit comic_path(comic)
    click_link "Delete Comic"
    expect(page).to have_content("Successfully deleted comic")
    expect(page).to_not have_content (comic.title)

  end
  scenario "an non-admin cannot delete a comic" do
    visit root_path
    sign_in_as(user)
    expect(page).to_not have_content("Update Comics")
    visit comics_path
    expect(page).to_not have_content("Delete Comic")
  end
end
