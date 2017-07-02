require 'rails_helper'

feature "User deletes subscription" do
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
  let!(:third_user_subscription) do
    FactoryGirl.create(:subscription, user: user, comic: third_comic)
  end
  scenario "A user can delete their own subscription" do
    visit root_path
    sign_in_as(user)
    visit comic_path(third_comic)
    click_link "End Subscription"
    expect(page).to have_content("Subscription ended")

  end
end
