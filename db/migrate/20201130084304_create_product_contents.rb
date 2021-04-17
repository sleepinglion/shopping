class CreateProductContents < ActiveRecord::Migration[6.0]
  def change
    create_table :product_contents do |t|
      t.references :product,:null=>false
      t.text :content,:null=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps null: false
    end
  end
end
