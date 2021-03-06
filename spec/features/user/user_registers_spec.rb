require 'spec_helper'

feature "User signs up", %q{
  As a new User
  I want to sign up for the application
  So I can participate
} do

  # Acceptance Criteria:
  # User must provide first name, last name, age, height, weight, gender, dob, email
  # User can optionally include a photo of myself as part of myregistration
  # If User supply a photo, it must be a jpg, png, or gif
  # If User supply a photo, it cannot exceed 5MB
  # TODO User must confirm via email to be signed up

  scenario "sign up with valid input" do
    visit root_path
    within('.nav_sign_up') do
      click_on 'Sign up'
    end

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
    attach_file 'Profile Picture', Rails.root.join('spec/file_fixtures/profile.jpg')
    click_on 'Submit'

    expect(page).to have_content("Welcome!")
    expect(User.last.profile_picture.url).to be_present
  end

  scenario "sign up with invalid input" do
    visit root_path
    within('.nav_sign_up') do
      click_on 'Sign up'
    end

    click_on 'Submit'

    expect(page).to have_content("Please review the problems below")
  end

  scenario "user already exists" do
      user = FactoryGirl.create(:user, email: 'heloo@example.com')
      visit root_path
      within('.nav_sign_up') do
        click_on 'Sign up'
      end

      fill_in 'First Name', with: 'Bob'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Age', with: 33
      fill_in 'Height', with: 70
      fill_in 'Weight', with: 200
      choose 'Male'
      fill_in 'Date of Birth', with: '11/12/2003'
      fill_in 'Email', with: 'heloo@example.com'
      fill_in 'Password', with: 'wwlwkjwarerj'
      fill_in 'Confirm password', with: 'wwlwkjwarerj'
      click_on 'Submit'

      expect(page).to have_content("already been taken")
  end
end
