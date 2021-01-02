class CreateUserLoginLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_login_logs do |t|
      t.references :user
      t.integer :client_ip, :null => false
      t.boolean :enable, :null => false, :default => false
      t.timestamps
    end
  end
end
