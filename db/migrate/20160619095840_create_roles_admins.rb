# encoding: utf-8
class CreateRolesAdmins < ActiveRecord::Migration
  def change
    create_table :roles_admins do |t|
      t.references :role, :admin
    end

    add_index :roles_admins, :role_id
    add_index :roles_admins, :admin_id, :unique=>true
    add_index :roles_admins, [:role_id, :admin_id], :unique=>true
  end
end
