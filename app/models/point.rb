class Point < ActiveRecord::Base
  validates_numericality_of :quantity, only_integer: true
  validates_presence_of :user
  validates_presence_of :team
  validates_presence_of :accomplishment

  belongs_to :user, inverse_of: :points
  belongs_to :team, inverse_of: :points
  belongs_to :accomplishment, inverse_of: :points
end
