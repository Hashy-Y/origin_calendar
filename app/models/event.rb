class Event < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :start_time, presence: true
end