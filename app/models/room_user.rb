class RoomUser < ApplicationRecord
  
  belongs_to :room, optional: true
  belongs_to :user, optional: true
  validates :user_id, presence: true
  validates :room_id, presence: true
  validates  :user_id, uniqueness: { scope: :room_id }
  validates  :room_id, uniqueness: { scope: :user_id }
end