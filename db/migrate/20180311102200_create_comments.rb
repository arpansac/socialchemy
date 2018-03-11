class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.string :parent_type
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
