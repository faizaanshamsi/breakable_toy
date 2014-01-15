require 'spec_helper'

feature "User creates a team", %q{
  As an Authenticated User
  I may join a team
  So that I can participate in the game
} do

  # Acceptance Criteria:
  # A team is full if it has 5 users
  # A full team cannot be joined
  # I may browse teams that are not full and join one

  scenario 'User without team joins new team' do
    team = FactoryGirl.create(:team)
    member = FactoryGirl.create(:user)
    sign_in_as(member)
    visit teams_path
    click_on 'Join'

    expect(member.reload.team).to eq(team)
    expect(page).to have_content "You're a member of #{team.name}!"
    expect(page).to have_content "#{team.name}"
  end

  scenario 'User with team tries to join' do
    team = FactoryGirl.create(:team)
    user = FactoryGirl.create(:user, team_id: team.id)
    sign_in_as(user)
    visit teams_path

    expect(page).to_not have_content "Join"
  end

  scenario 'User tries to join a full team' do
    team = FactoryGirl.create(:team)
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:user)
    5.times do
      FactoryGirl.create(:user, team_id: team.id)
    end
    sign_in_as(user)
    visit teams_path
    expect(page).to_not have_content "Join"
  end

end
