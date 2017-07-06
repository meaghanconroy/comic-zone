require 'rails_helper'

feature "User views list of all comics" do
  let!(:user) do
    FactoryGirl.create(:user)
  end
  let!(:first_comic) do
    FactoryGirl.create(:comic)
  end
  let!(:second_comic) do
    FactoryGirl.create(:comic, publisher: 'Image', title: 'Wytches', writer: 'Scott Snyder')
  end
  let!(:third_comic) do
    FactoryGirl.create(:comic, publisher: 'Image', title: 'Saga', writer: 'Brian K Vaughn', artist: 'Fiona Staples')
  end
  let!(:first_user_subscription) do
    FactoryGirl.create(:subscription, user: user, comic: first_comic)
  end
  let!(:second_user_subscription) do
    FactoryGirl.create(:subscription, user: user, comic: second_comic)
  end

  scenario 'a user can add a comic to their subscriptions list' do
    visit root_path
    sign_in_as(user)
    visit comic_path(third_comic)
    click_link "Add Subscription"

    visit user_comics_path(user)
    visit user_subscriptions_path(user)
    expect(page).to have_content "3 CURRENT SUBSCRIPTION(S):"
    expect(page).to have_link(first_comic.title)
    expect(page).to have_link(second_comic.title)
    expect(page).to have_link(third_comic.title)
  end

end
