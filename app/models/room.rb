class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :group_users
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
end
