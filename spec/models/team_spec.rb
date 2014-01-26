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

    it 'should return total points' do
      team = FactoryGirl.create(:team)
      Point.create(quantity: 100, team_id: team.id)

      expect(team.total_points).to eql(100)
    end

    it 'should return rank by points' do
      team_1 = FactoryGirl.create(:team)
      team_2 = FactoryGirl.create(:team, name: "team2", captain_id: 3)
      point = FactoryGirl.create(:point, team_id: team_2.id)

      expect(team_1.rank).to eql(2)
      expect(team_2.rank).to eql(1)
    end

    it 'should return points this week' do
      team_1 = FactoryGirl.create(:team)
      point = FactoryGirl.create(:point, team_id: team.id)
      point_2 = FactoryGirl.create(:point, team_id: team.id, created_at: 1.month.ago)

      expect(team_1.weekly_score).to eql(100)
    end

    it 'should return top scoring team weekly points' do
      team_1 = FactoryGirl.create(:team)
      point = FactoryGirl.create(:point, team_id: team_1.id)

      expect(Team.leader_weekly_score).to eql(100)
    end
  end
end
