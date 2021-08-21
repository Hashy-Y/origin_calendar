class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.datetime :start_time, null: false
      t.timestamps
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
