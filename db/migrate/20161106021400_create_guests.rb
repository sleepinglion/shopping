# encoding: utf-8
class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.references :order, :null=>false
      t.string :name, :null=>false, :limit=>60
      t.string :email, :null=>false, :limit=>100
      t.string :phone, :null=>false, :limit=>20   
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
