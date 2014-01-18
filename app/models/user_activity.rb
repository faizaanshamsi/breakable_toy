class UserActivity < ActiveRecord::Base
  validates_presence_of :user
  validates_presence_of :activity
  validates_uniqueness_of :user_id, scope: :activity_id

  belongs_to :user, inverse_of: :user_activities
  belongs_to :activity, inverse_of: :user_activities
  has_many :accomplishments, inverse_of: :user_activity

end
