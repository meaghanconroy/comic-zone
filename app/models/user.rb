require 'uri'
class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :subscriptions
  has_many :comics, through: :subscriptions

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  after_create :send_welcome_email

  def self.weekly_reminder
    @user = User.all
    @user.each do |u|
      @name = u.first_name
      @email = u.email
      UserMailer.weekly_email(@email).deliver_later
    end
  end
  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
