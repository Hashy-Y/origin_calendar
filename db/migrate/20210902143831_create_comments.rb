class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      
    end
  end
end
