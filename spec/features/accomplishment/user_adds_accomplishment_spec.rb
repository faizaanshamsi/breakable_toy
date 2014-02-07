require 'spec_helper'

feature "User adds accomplishment", %q{
  As an Authenticated User
  I can choose an activity
  So that I can earn accomplishments for that activity
} do

  # Acceptance Criteria:
  # User may log a chosen activity
  # User must enter duration
  # Team and User will earn points

  scenario 'User creates accomplishment' do
    activity = FactoryGirl.create(:activity)
    user = FactoryGirl.create(:user)
    user_activity = FactoryGirl.create(:user_activity, user_id: user.id, activity_id: activity.id)
    sign_in_as(user)
    visit user_path(user)

    click_on 'Add New Accomplishment'
    save_and_open_page
    fill_in 'How many minutes?', with: 30
    click_on 'Submit'

    expect(page).to have_content "#{activity.name}"
    expect(user.reload.points.count).to eql(1)
    expect(user.accomplishments.count).to eql(1)
  end
end
