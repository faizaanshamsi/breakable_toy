class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name
  validates_numericality_of :weight, :height
  validates_numericality_of :age, only_integer: true
  validates :gender, presence: true, inclusion: { in: ['Male', 'Female'] }

  mount_uploader :profile_picture, ProfilePictureUploader

  belongs_to :team, inverse_of: :users
  has_many :user_activities, dependent: :destroy
  has_many :activities, through: :user_activities

  def captain?
    Team.where(captain_id: self.id).empty? ? false : true
  end

  def has_team?
    self.team_id != nil ? true : false
  end

  def has_activity?(activity)
    #user.activities contains activity
  end
end
