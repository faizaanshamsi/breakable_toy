require 'spec_helper'

describe User do

  describe "Database Tests" do
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:gender).of_type(:string) }
    it { should have_db_column(:height).of_type(:integer) }
    it { should have_db_column(:weight).of_type(:integer) }
    it { should have_db_column(:age).of_type(:integer) }
    it { should have_db_column(:date_of_birth).of_type(:date) }
  end

  describe "Validation Tests" do
    it { should have_valid(:first_name).when("faizaan") }
    it { should_not have_valid(:first_name).when(nil, "") }
    it { should have_valid(:last_name).when("faizaan") }
    it { should_not have_valid(:last_name).when(nil, "") }
    it { should have_valid(:gender).when("Male", "Female") }
    it { should_not have_valid(:gender).when(nil, "", "Blue") }
    it { should validate_numericality_of(:height) }
    it { should validate_numericality_of(:weight) }
    it { should validate_numericality_of(:age).only_integer }
  end

  describe "Association Tests" do
    it { should belong_to(:team) }
  end

  describe 'determine captainship' do
    it 'should check if user is a captain' do
      user = FactoryGirl.create(:user, email: 'haha@example.com')
      team = FactoryGirl.create(:team, captain_id: user.id)
      expect(user.captain?).to be_true
    end
  end
end
