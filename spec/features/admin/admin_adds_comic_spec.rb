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
    fill_in 'Creator', with: "#{comic.creators.first};Joe Painter, colorist"
    fill_in 'Characters', with: "#{comic.characters.first};Hellcat/Captain Marvel"
    click_button 'Add Comic'
    expect(page).to have_content("Successfully added comic")
    expect(page).to have_content(comic.title)

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
    fill_in 'Creators', with: "Silly person one, writer;Silly person 3, colorist"
    fill_in 'Characters', with: "Fake Character;Faker Character"
    click_button 'Add Comic'
    expect(page).to_not have_content("Successfully created comic")
    expect(page).to have_content("Publisher can't be blank")
  end
end
