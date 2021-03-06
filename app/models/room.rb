class Room < ApplicationRecord
  before_create :default_image

  validates :name, presence: true
  validates :password, presence: true
  
  has_secure_password
  has_many :applies, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :comments
  belongs_to :user
  has_one_attached :image

  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  attr_accessor :user_ids

  # 手動アソシエーション
  def users
    RoomUser.includes(:user).where(room_id: self.id).map(&:user)
  end

  def create
    ActiveRecord::Base.transaction(joinable: false, requires_new: true) do
      super # Roomを保存
      save_room_users # Roomを保存してからRoomUserの保存
    end
  end

  def save
    ActiveRecord::Base.transaction(joinable: false, requires_new: true) do
      super # Roomを保存
      save_room_users # Roomを保存してからRoomUserの保存
    end
  end

  def destroy
    ActiveRecord::Base.transaction(joinable: false, requires_new: true) do
      # RoomUserを削除してからRoomの削除
      RoomUser.where(room_id: self.id).map(&:destroy) # 手動`dependent: :destroy`
      super # Roomの削除
    end
  end

  def self.search(search)
    if search != ""
      Room.where('name LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end

  private

  def save_room_users
    self.user_ids.each do |user_id|
      RoomUser.create(user_id: user_id, room_id: self.id)
    end
  end

  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'room_default.png')), filename: 'default-image.png', content_type: 'image/png')
    end
  end

end
