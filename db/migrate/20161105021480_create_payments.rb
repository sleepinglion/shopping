# encoding: utf-8
class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :title, :null=>false, :limit=>60
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
