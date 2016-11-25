class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.references :user
      t.string :title, :null=>false, :limit=>60
      t.integer :view_count, :default => 0
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end

    create_table :notice_contents do |t|
      t.boolean :html,:default=>0,:null=>false
      t.text :content,:null=>false
    end

    add_foreign_key :notices, :users, on_delete: :cascade, on_update: :cascade
    add_foreign_key :notice_contents,:notices,column: :id, on_delete: :cascade, on_update: :cascade
  end
end
