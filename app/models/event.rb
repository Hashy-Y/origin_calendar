class Event < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true
  validates :start_time, presence: true
end
