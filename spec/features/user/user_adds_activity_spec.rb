require 'spec_helper'

feature "User chooses activity", %q{
  As an Authenticated User
  I can choose an activity
  So that I can earn accomplishments for that activity
} do

  # Acceptance Criteria:
  # User will choose activity
  # Options must exclude activities user has already chosen
  # TODO: Goals

  scenario 'User chooses new activity' do
    activity = FactoryGirl.create(:activity)
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit activities_path

    click_on "Add #{activity.name}"
    expect(user.reload.activities.last.name).to eql("#{activity.name}")
  end

  scenario 'User tries to add activity they already chose' do
    activity = FactoryGirl.create(:activity)
    user = FactoryGirl.create(:user)
    user_activity = FactoryGirl.create(:user_activity, user_id: user.id, activity_id: activity.id)
    sign_in_as(user)
    visit activities_path

    expect(page).to_not have_content 'Add Activity'
  end

end


