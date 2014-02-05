class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
     
      
      t.string :ip
      t.string :browser_name
      t.string :browser_version
      t.string :os_name
      t.string :os_version
      t.integer :devise_type

      t.timestamps
    end
  end
end
