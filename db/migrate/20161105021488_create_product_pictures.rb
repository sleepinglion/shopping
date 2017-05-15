class CreateProductPictures < ActiveRecord::Migration
  def change
    create_table :product_pictures do |t|
      t.references :product, :null => false
#      t.string :filetype, :null => false
#      t.string :fileext, :null => false
#      t.integer :filesize, :null => false, :default => 0
#      t.string :checksum, :null => false
      t.string :photo, :null => false, :limit=>200
      t.boolean :enable, :null => false, :default=>false
      t.timestamps
    end

    add_foreign_key :product_pictures, :products, on_delete: :cascade, on_update: :cascade
  end
end
