class Activity < ActiveRecord::Base
  validates :name, uniqueness: true, length: { minimum: 1 }
end
