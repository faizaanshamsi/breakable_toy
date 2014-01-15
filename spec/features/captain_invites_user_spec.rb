require 'spec_helper'

feature "User creates a team", %q{
  As member of an unfilled team
  I may invite users
  So that I may fill my team
} do

  # Acceptance Criteria:
  # I may invite signed up or new users via email
  # I may not invite users who are on another team
  # I may not invite users if team is full

  scenario 'Member invites teamless user' do
    team = FactoryGirl.create(:team)
    member = FactoryGirl.create(:user, team_id: team.id)
    sign_in_as(member)
    visit team_path(team)

    click_on 'Invite Someone'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Message', with: 'Join my team'
    click_on 'Submit'

    expect(page).to have_content "Your invitation was sent"
    expect(page).to have_content "#{team.name}"



  end

  scenario 'Captain invites user already belonging to team' do
    team = FactoryGirl.create(:team)
    captain = FactoryGirl.create(:user, team_id: team.id)
    user = FactoryGirl.create(:user, email: 'already@exists.com')
    sign_in_as(captain)
    visit team_path(team)

    click_on 'Invite Someone'
    fill_in 'Email', with: 'already@exists.com'
    fill_in 'Message', with: 'Join my team'
    click_on 'Submit'

    expect(page).to have_content "That person already belongs to a team"
    expect(page).to have_content "Invite someone to your team"

  end

end
