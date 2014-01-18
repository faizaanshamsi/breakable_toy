class Point < ActiveRecord::Base
  validates_numericality_of :quantity, only_integer: true

  belongs_to :user, inverse_of: :points
  belongs_to :team, inverse_of: :points
  belongs_to :accomplishment, inverse_of: :points
end
