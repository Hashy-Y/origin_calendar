class RemoveImageAndDescriptionFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :image, :string
  end
end
