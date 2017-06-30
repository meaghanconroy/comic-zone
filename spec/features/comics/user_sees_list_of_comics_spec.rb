require 'rails_helper'

feature "User views list of all comics" do
  let!(:user) do
    FactoryGirl.create(:user)
  end
  let!(:first_comic) do
    FactoryGirl.create(:comic)
  end
  let!(:second_comic) do
    FactoryGirl.create(:comic, publisher: 'Image', title: 'Wytches', creators: ['Scott Snyder, writer'], characters: ['Alana', 'Marko'])
  end
  let!(:third_comic) do
    FactoryGirl.create(:comic, publisher: 'Image', title: 'Saga', creators: ['Brian K Vaughn, writer', 'Fiona Staples, illustrator'], characters: nil)
  end
  scenario 'a user can view a list of all comics' do
    visit root_path
    sign_in_as(user)
    visit comics_path
    expect(page).to have_content(first_comic.publisher)
    expect(page).to have_content(first_comic.title)
    expect(page).to have_content(first_comic.creators.first)
    expect(page).to have_content(first_comic.characters.first)

    expect(page).to have_content(second_comic.publisher)
    expect(page).to have_content(second_comic.title)
    expect(page).to have_content(second_comic.creators.first)
    expect(page).to have_content(second_comic.characters.first)

    expect(page).to have_content(third_comic.publisher)
    expect(page).to have_content(third_comic.title)
    expect(page).to have_content(third_comic.creators.first)
  end
end
