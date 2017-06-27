class Comic < ApplicationRecord
  has_many :subscriptions

  validates :publisher, presence: true
  validates :title, presence: true
end
