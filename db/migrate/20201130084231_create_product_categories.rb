class CreateProductCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :product_categories do |t|
      t.string :title,:null=>false
      t.string :description
      t.string :bg_color
      t.integer :order_no,:null=>false, :default=>0
      t.integer :products_count, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps null: false
    end
  end
end
