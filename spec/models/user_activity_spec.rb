require 'spec_helper'

describe UserActivity do
  describe "Database Tests" do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:activity_id).of_type(:integer) }
  end

  describe "Validation Tests" do

    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:activity) }
    it 'should validate_uniqueness_of each pair' do
      # user = FactoryGirl.create(:user)
      # activity = FactoryGirl.create(:activity)
      # UserActivity.create!(user: user, activity: activity)
      FactoryGirl.create(:user_activity)
      should validate_uniqueness_of(:user_id).scoped_to(:activity_id)
    end
  end

  describe "Association Tests" do
    it { should belong_to(:user) }
    it { should belong_to(:activity) }
  end

end
