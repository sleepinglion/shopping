# encoding: utf-8

class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title, :null=>false, :limit=>60
      t.boolean :flag, :null=>false, :default=>true
      t.timestamps
    end
  end
end
