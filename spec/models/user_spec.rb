require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:username).when('userfriend234', 'sillyname382') }
  it { should_not have_valid(:username).when(nil,'') }

  it { should have_valid(:first_name).when('John', 'Sally') }
  it { should_not have_valid(:first_name).when(nil,'') }

  it { should have_valid(:last_name).when('Smith', 'Swanson') }
  it { should_not have_valid(:last_name).when(nil,'') }

  it { should have_valid(:email).when('user@example.com', 'another@gmai.com') }
  it { should_not have_valid(:email).when(nil,'','urser','usersr@com' ) }

  it 'has a matching password confirmation for the password' do
    user = FactoryGirl.create(:user)
    user_2 = FactoryGirl.build(:user, email: user.email)
    user_3 = FactoryGirl.build(:user, username: user.username, email: "differentemail@gma.com")

    expect { user_2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    expect { user_3.save! }.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
