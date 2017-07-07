require 'rails_helper'

feature "User views specific comic" do
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

  scenario 'a user can view a specific comic' do
    @cap_marvel = cap_marvel
    @ironman = ironman
    @black_panther = black_panther
    @black_widow = black_widow
    visit root_path
    sign_in_as(user)
    visit comic_path(comic)
    expect(page).to have_content(comic.publisher)
    expect(page).to have_content(comic.title)
    expect(page).to have_content(comic.writer)
    expect(page).to have_content(comic.artist)
    expect(page).to have_content(comic.main_character)
    expect(page).to have_content(comic.other_characters)
    expect(page).to have_content "Ongoing: TRUE"
  end
end
