class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates :email, presence: true
  validates :password, presence: true
  validates :name, presence: true
  has_many :protos
  has_many :comments
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
