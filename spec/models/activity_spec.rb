require 'spec_helper'

describe Activity do
  describe "Database Tests" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:met).of_type(:float) }
    it { should have_db_column(:cardiovascular).of_type(:boolean) }
    it { should have_db_column(:bone_strength).of_type(:boolean) }
    it { should have_db_column(:resistance).of_type(:boolean) }

  end

  describe "Validation Tests" do

    it { should have_valid(:name).when("faizaan") }
    it { should_not have_valid(:name).when(nil, "") }
    it 'should validate_uniqueness_of name' do
      Activity.create(name: 'activity', met: 3.4)
      should validate_uniqueness_of :name
    end
  end

  describe "Association Tests" do
    #after seeding
  end

end
