class Comic < ApplicationRecord
  validates :publisher, presence: true
  validates :title, presence: true
end
