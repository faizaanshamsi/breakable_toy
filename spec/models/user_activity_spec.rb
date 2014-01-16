require 'spec_helper'

describe Team do
  describe "Database Tests" do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:activity_id).of_type(:integer) }
  end

  describe "Validation Tests" do

    it { should validate_numericality_of(:user_id).only_integer }
    it { should validate_numericality_of(:activity_id).only_integer }
    it 'should validate_uniqueness_of each pair' do
      UserActivity.create!(user_id: 4, activity_id: 4)
      should validate_uniqueness_of(:user_id).scoped_to(:activity_id)
    end
  end

  describe "Association Tests" do
    it { should belong_to(:user) }
    it { should belong_to(:activity) }
  end

end
