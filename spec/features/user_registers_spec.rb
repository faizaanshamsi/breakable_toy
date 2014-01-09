require 'spec_helper'

feature "User signs up", %q{
  As a new User
  I want to sign up for the application
  So I can participate
} do

  # Acceptance Criteria:
  # User must provide first name, last name, age, height, weight, gender, dob, email
  # TODO User may optionally upload an image
  # TODO User must confirm via email to be signed up

  scenario "sign up with valid input" do
    visit root_path
    click_on 'Sign up'

    fill_in 'First Name', with: 'Bob'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Age', with: 33
    fill_in 'Height', with: 70
    fill_in 'Weight', with: 200
    choose 'Male'
    fill_in 'Date of Birth', with: '11/12/2003'
    fill_in 'Email', with: 'bob_smith@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm password', with: 'password'
    click_on 'Submit'

    expect(page).to have_content("Logged in as bob_smith@example.com")
  end

  scenario "sign up with invalid input" do
    visit root_path
    click_on 'Sign up'

    click_on 'Submit'

    expect(page).to have_content("Please review the problems below")
  end

  scenario "user already exists" do
      user = FactoryGirl.create(:user)
      visit root_path
      click_on 'Sign up'

      fill_in 'First Name', with: 'Bob'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Age', with: 33
      fill_in 'Height', with: 70
      fill_in 'Weight', with: 200
      choose 'Male'
      fill_in 'Date of Birth', with: '11/12/2003'
      fill_in 'Email', with: 'bob_smith@example.com'
      fill_in 'Password', with: 'wwlwkjwarerj'
      fill_in 'Confirm password', with: 'wwlwkjwarerj'
      click_on 'Submit'

      expect(page).to have_content("already been taken")
  end
end
