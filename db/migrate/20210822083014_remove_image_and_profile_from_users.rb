class RemoveImageAndProfileFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :image, :string
    remove_column :users, :description, :text
  end
end
