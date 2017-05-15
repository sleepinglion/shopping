class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :title, :null=>false, :limit=>60
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
