class Accomplishment < ActiveRecord::Base

  validates_presence_of :user_activity
  validates_numericality_of :duration, only_integer: true

  has_many :points, inverse_of: :accomplishment
  belongs_to :user_activity, inverse_of: :accomplishments
  belongs_to :user, inverse_of: :accomplishments
end
