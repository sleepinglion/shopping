class CreateUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :email, :null=>false, :limit=>100
      t.string :name, :null => false, :limit=>40
      t.string :encrypted_password, :null => false, :limit=>60  
      t.string :phone, :null=>false, :limit=>20
      t.date :birthday, :null=>false
      t.boolean :sex, :null=>false, :default=>false
      t.integer :weight
      t.integer :height
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps :null=>false
    end

    add_index :users, :email, :unique => true
  end
end
