require 'rails_helper'

RSpec.describe Comic, type: :model do
  it { should have_many :subscriptions }

  it { should have_valid(:publisher).when('Marvel', 'DC') }
  it { should_not have_valid(:publisher).when(nil,'') }

  it { should have_valid(:title).when('Captain Marvel', 'Squirrel Girl') }
  it { should_not have_valid(:title).when(nil,'') }
end
