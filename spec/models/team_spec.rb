require 'spec_helper'

describe Team do
  describe "Database Tests" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:captain_id).of_type(:integer) }
  end

  describe "Validation Tests" do
    it { should have_valid(:name).when("faizaan") }
    it { should_not have_valid(:name).when(nil, "") }
    it { should validate_numericality_of(:captain_id).only_integer }
  end

  describe "Association Tests" do
    it { should have_one(:captain) }
    it { should have_many(:users) }
  end
end
