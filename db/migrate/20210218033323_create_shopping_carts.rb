class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_carts do |t|
      # t.references :user,:null=>false
      t.timestamps null: false
    end
  end
end
