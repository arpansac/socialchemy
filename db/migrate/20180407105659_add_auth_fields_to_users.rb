class AddAuthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth_token, :string
    add_column :users, :token_is_valid, :boolean
  end
end
