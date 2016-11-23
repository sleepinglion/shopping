# encoding: utf-8
class CreateProductPictures < ActiveRecord::Migration
  def change
    create_table :product_pictures do |t|
      t.references :product, :null => false
#      t.string :filetype, :null => false
#      t.string :fileext, :null => false
#      t.integer :filesize, :null => false, :default => 0
#      t.string :checksum, :null => false
      t.string :photo
      t.boolean :enable, :null => false, :default=>false
      t.timestamps
    end

    add_index :product_pictures, :product_id
  end
end
