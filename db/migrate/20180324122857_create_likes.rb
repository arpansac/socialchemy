class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :parent_type, null: false
      t.integer :parent_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
