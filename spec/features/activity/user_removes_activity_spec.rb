require 'spec_helper'

feature "User removes activity", %q{
  As an Authenticated User
  I can remove a chosen activity
  So I can change my dashboard to reflect new activities
} do

  # Acceptance Criteria:
  # User will remove activity from profile

  scenario 'User removes activity' do
    activity = FactoryGirl.create(:activity)
    user = FactoryGirl.create(:user)
    user_activity = FactoryGirl.create(:user_activity, user_id: user.id, activity_id: activity.id)
    sign_in_as(user)
    visit user_path(user)

    expect(page).to have_content("#{activity.name}")
    click_on "Remove"
    save_and_open_page
    within(".row.profile-activity") do
      expect(page).to_not have_content("#{activity.name}")
    end
  end
end
