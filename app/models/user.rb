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

  def captain?
    Team.where(captain_id: self.id).empty? ? false : true
  end
end
