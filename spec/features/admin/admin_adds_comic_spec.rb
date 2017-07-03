require "rails_helper"

feature "Admin creates a comic record" do
  let!(:admin) do
    User.create(username: "shehulk", first_name: "Jennifer", last_name: "Walters", email: "jwalters@lawfirm.com", password: "password", password_confirmation: "password",
    admin: true)
  end
  let!(:user) do
    FactoryGirl.create(:user)
  end
  let(:comic) do
    FactoryGirl.create(:comic)
  end

  scenario "an admin can create a comic record" do

    visit root_path
    sign_in_as(admin)
    visit comics_path
    click_link "Add Comic"
    fill_in 'Publisher', with: comic.publisher
    fill_in 'Title', with: comic.title
    fill_in 'Writer', with: comic.writer
    fill_in 'Artist', with: comic.artist
    fill_in 'Main Character', with: comic.main_character
    fill_in 'Other Character(s)', with: comic.other_characters
    fill_in 'Title', with: comic.title

    click_button 'Add Comic'
    expect(page).to have_content("Successfully added comic")
    expect(page).to have_content(comic.title)
    expect(page).to have_content(comic.writer)
    expect(page).to have_content(comic.artist)


  end
  scenario "an non-admin cannot create a comic record" do
    visit root_path
    sign_in_as(user)
    expect(page).to_not have_content("Add Comic")
  end

  scenario "an admin fails to create a comic record" do
    visit root_path
    sign_in_as(admin)
    visit comics_path
    click_link "Add Comic"
    fill_in 'Publisher', with: ''
    fill_in 'Title', with: 'Unpublished Comic'
    click_button 'Add Comic'
    expect(page).to_not have_content("Successfully created comic")
    expect(page).to have_content("Publisher can't be blank")
  end
end
