require 'spec_helper'

describe Point do
  describe "Database Tests" do
    it { should have_db_column(:quantity).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:team_id).of_type(:integer) }
    it { should have_db_column(:accomplishment_id).of_type(:integer) }
  end

  describe "Validation Tests" do
    it { should validate_numericality_of(:quantity).only_integer }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:team) }
    it { should validate_presence_of(:accomplishment) }
  end

  describe "Association Tests" do
    it { should belong_to(:user) }
    it { should belong_to(:team) }
    it { should belong_to(:accomplishment) }
  end

end
