class CreateProductCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :product_categories do |t|
      t.string :title, :null=>false, :limit=>60
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
