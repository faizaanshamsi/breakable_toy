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
    it 'should validate_uniqueness_of name' do
      Team.create(captain_id: 4, name: 'team')
      should validate_uniqueness_of :name
    end
  end

  describe "Association Tests" do
    it { should have_one(:captain) }
    it { should have_many(:users) }
    it { should have_many(:points) }
  end

  describe "Class Methods" do
    it 'should return maximum allowed team size' do
      expect(Team.max_size).to eql(5)
    end
  end
end
