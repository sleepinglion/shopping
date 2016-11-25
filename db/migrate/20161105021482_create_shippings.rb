class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.references :user
      t.boolean :same_order, :null=>false, :default=>false      
      t.string :name, :null=>false, :limit=>60     
      t.string :zip_code, :null=>false, :limit=>60
      t.string :address_default, :null=>false, :limit=>60
      t.string :address_detail, :null=>false, :limit=>60           
      t.string :phone, :null=>false, :limit=>60
      t.string :email, :null=>false, :limit=>60      
      t.text :message
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
    
    add_foreign_key :shippings, :users
  end
end
