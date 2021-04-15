class CreateAccountsPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts_payments do |t|
      t.references :account, null: false
      t.references :payment, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end
  end
end
