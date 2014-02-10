class AddEmailConfirmToUser < ActiveRecord::Migration
  def change
    add_column :users, :EmailConfirm, :boolean
    add_column :users, :EmailToken, :string
  end
end
