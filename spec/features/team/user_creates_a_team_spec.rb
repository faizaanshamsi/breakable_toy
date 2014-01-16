require 'spec_helper'

feature "User creates a team", %q{
  As an authenticated user
  I may create a team
  So I can participate in the competition
} do

  # Acceptance Criteria:
  # I may not be a member of any teams if I wish to create a team
  # Team name must be unique
  # The max team limit must not have been reached
  # I will be assigned captain to any team I create

  scenario 'Authenticated user creates a team and becomes captain' do
    count = Team.all.count
    user = FactoryGirl.create(:user, email: 'lol@lol.com')
    sign_in_as(user)

    visit new_team_path
    fill_in "Team name", with: "Best Team"

    click_on "Create Your Team, Captain"
    expect(page).to have_content "Best Team"
    expect(page).to have_content "#{user.first_name}"
    expect(Team.all.count).to eql(count + 1)
    expect(user.captain?).to be_true
  end

  scenario 'Unauthenticated user gets redirected to sign in page' do
    user = FactoryGirl.create(:user, email: 'lol@lol.com')
    visit new_team_path

    expect(page).to have_content "Email Password"
  end

  scenario 'Team alreay exists' do
    count = Team.all.count + 1
    user = FactoryGirl.create(:user, email: 'lol@lol.com')
    team = FactoryGirl.create(:team)
    sign_in_as(user)

    visit new_team_path
    fill_in "Team name", with: team.name

    click_on "Create Your Team, Captain"
    expect(page).to have_content "Team namehas already been taken"
    expect(Team.all.count).to eql(count)
  end

  scenario 'User is already part of a team' do
    team = FactoryGirl.create(:team, id: 4)
    user = FactoryGirl.create(:user, email: 'lol@lol.com', team_id: 4)
    sign_in_as(user)
    visit new_team_path

    expect(page).to have_content "You are already part of a team"
    expect(page).to have_content "#{team.name}"
  end

  #TODO -
  # scenario 'Max number of teams must not have been reached' do
  #
  # end
end
