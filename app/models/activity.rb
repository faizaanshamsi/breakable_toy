class Activity < ActiveRecord::Base
  validates :name, uniqueness: true, length: { minimum: 1 }

  has_many :user_activities, dependent: :destroy
  has_many :users, through: :user_activities


end
