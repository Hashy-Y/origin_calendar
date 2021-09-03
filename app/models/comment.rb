class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :event

  validates :text, presence: true
end
