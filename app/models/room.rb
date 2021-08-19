class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :group_users
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
end
