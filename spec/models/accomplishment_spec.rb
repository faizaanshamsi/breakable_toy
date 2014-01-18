require 'spec_helper'

describe Accomplishment do
  describe "Database Tests" do
    it { should have_db_column(:user_activity_id).of_type(:integer) }
    it { should have_db_column(:duration).of_type(:integer) }
  end

  describe "Validation Tests" do
    it { should validate_presence_of(:user_activity) }
    it { should validate_numericality_of(:duration) }
  end

  describe "Association Tests" do
    it { should belong_to(:user_activity) }
    it { should have_many(:points) }
    it { should belong_to(:user) }
  end

end
