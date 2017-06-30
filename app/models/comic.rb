class Comic < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :publisher, presence: true
  validates :title, presence: true
end
