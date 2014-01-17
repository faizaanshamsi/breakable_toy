class Accomplishment < ActiveRecord::Base

  validates_numericality_of :user_activity_id, only_integer: true, allow_nil: false
  validates_numericality_of :duration, only_integer: true

  has_many :points, inverse_of: :accomplishment
  belongs_to :user_activity, inverse_of: :accomplishments
end
