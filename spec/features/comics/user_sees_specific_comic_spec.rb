require 'rails_helper'

feature "User views list of all comics" do
  let!(:user) do
    FactoryGirl.create(:user)
  end
  let!(:first_comic) do
    FactoryGirl.create(:comic)
  end

  scenario 'a user can view a list of all comics' do
    visit root_path
    sign_in_as(user)
    visit comics_path
    click_link "#{first_comic.title}"
    expect(page).to have_content(first_comic.publisher)
    expect(page).to have_content(first_comic.title)
    expect(page).to have_content(first_comic.creators.first)
    expect(page).to have_content(first_comic.characters.first)
  end
end
