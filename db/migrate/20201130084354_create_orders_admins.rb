class CreateOrdersAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_admins do |t|
      t.references :order, null: false
      t.references :admin, null: false
      t.boolean :enable, null: false, default: true
    end
  end
end
