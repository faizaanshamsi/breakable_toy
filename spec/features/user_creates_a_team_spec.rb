require 'spec_helper'

feature "User creates a team", %q{
  As an authenticated user
  I may create a team
  So I can participate in the competition
} do

  # Acceptance Criteria:
  # I may not be a member of any teams if I wish to create a team
  # The max team limit must not have been reached
  # I will be assigned captain to any team I create

  scenario 'Authenticated user creates a team and becomes captain' do
    count = Team.all.count
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_team_path
    fill_in "Team name", with: "Best Team"

    click_on "Create Team, Captain"

    expect(page).to have_content "Best Team"
    expect(page).to have_content "#{user.name}"
    expect(Team.all.count).to eql(count + 1)
  end

  # scenario 'Unauthenticated user attempts to create a team'

  # scenario 'User already belongs to a team' do

  end
