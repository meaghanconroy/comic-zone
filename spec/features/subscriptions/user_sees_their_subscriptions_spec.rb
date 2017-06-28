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
  let!(:first_user_subscription) do
    FactoryGirl.create(:subscription, user: user, comic: first_comic)
  end
  let!(:second_user_subscription) do
    FactoryGirl.create(:subscription, user: user, comic: second_comic)
  end
  let!(:third_user_subscription) do
    FactoryGirl.create(:subscription, user: user, comic: third_comic)
  end
  scenario 'a user can view a list of their comic subscriptions' do
    visit root_path
    sign_in_as(user)
    visit user_path(user)
    click_link "Your Subscriptions"
    visit user_subscriptions_path(user)
    expect(page).to have_content "3 CURRENT SUBSCRIPTIONS:"
    expect(page).to have_content(first_user_subscription.comic.title)
    expect(page).to have_content(second_user_subscription.comic.title)
    expect(page).to have_content(third_user_subscription.comic.title)
  end
end
