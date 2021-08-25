class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i} do
    validates :password
    validates :password_confirmation
  end

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :owned_groups, class_name: "Group"
  has_many :applies, dependent: :destroy
  has_many :events

  def already_applied?(room)
    self.applies.exists?(room_id: room.id)
  end
end
