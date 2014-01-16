class UserActivity < ActiveRecord::Base
  validates_numericality_of :user_id, only_integer: true, null: false
  validates_numericality_of :activity_id, only_integer: true, null: false
  validates_uniqueness_of :user_id, scope: :activity_id

  belongs_to :user, inverse_of: :user_activities
  belongs_to :activity, inverse_of: :user_activities

end
