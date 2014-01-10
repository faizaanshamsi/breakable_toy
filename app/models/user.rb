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
end
