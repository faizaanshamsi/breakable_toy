class Team < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :captain_id, only_integer: true

  has_one :captain, class_name: 'User'
  has_many :users, inverse_of: :team
end