class Point < ActiveRecord::Base
  validates_numericality_of :quantity, only_integer: true, allow_nil: false
  validates_numericality_of :user_id, only_integer: true
  validates_numericality_of :team_id, only_integer: true
  validates_numericality_of :accomplishment_id, only_integer: true

  belongs_to :user, inverse_of: :points
  belongs_to :team, inverse_of: :points
  belongs_to :accomplishment, inverse_of: :points
end
