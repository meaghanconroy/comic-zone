require "rails_helper"

feature "Admin edits a comic" do
  let!(:admin) do
    User.create(username: "shehulk", first_name: "Jennifer", last_name: "Walters", email: "jwalters@lawfirm.com", password: "password", password_confirmation: "password",
    admin: true)
  end
  let!(:user) do
    FactoryGirl.create(:user)
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

  scenario "an admin can edit a comic's ongoing status" do
    @cap_marvel = cap_marvel
    @ironman = ironman
    @black_panther = black_panther
    @black_widow = black_widow
    visit root_path
    sign_in_as(admin)
    click_link "Update Comics"
    visit comic_path(comic)
    click_link "Edit Comic"
    choose("Series Ended")
    click_button "Submit Changes"
    expect(page).to have_content("Comic Updated")
    expect(page).to have_content("Ongoing: FALSE")

  end

  scenario "an admin incorrectly edits a comic's info" do
    visit root_path
    sign_in_as(admin)
    click_link "Update Comics"
    visit comic_path(comic)
    click_link "Edit Comic"

    fill_in 'Publisher', with: ""
    choose("Series Ended")
    click_button "Submit Changes"
    expect(page).to_not have_content("Comic Updated")
    expect(page).to have_content("Publisher can't be blank")

  end
  scenario "an non-admin cannot edit a comic" do
    visit root_path
    sign_in_as(user)
    expect(page).to_not have_content("Update Comics")
    visit comics_path
    expect(page).to_not have_content("Edit Comic")
  end
end
