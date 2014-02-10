class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.string :post
      t.integer :usr
      t.string :date

      t.timestamps
    end
  end
end
