class Team < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  validates_numericality_of :captain_id, only_integer: true

  has_one :captain, class_name: 'User'
  has_many :users, inverse_of: :team
  has_many :points, inverse_of: :team

  def self.max_size
    5
  end

  def total_points
    sum = points.all.inject(0) { |sum, point| sum + point.quantity }
  end

  def rank
    teams = Team.all
    points = []
    teams.each { |team| points << team.total_points }
    points.sort! { |x, y| y <=> x }
    rank = 1
    points.each do |point|
      if point <= total_points
        next
      end
      rank += 1
    end
    rank
  end

  def weekly_score
    points.where('created_at >= ?', 1.week.ago ).inject(0) { |sum, point| sum + point.quantity}
  end

end
