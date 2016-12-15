class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :order, :null=>false
      t.references :report_category, :null=>false      
      t.references :related_action, :null=>false
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
    
    add_index :reports, [:order_id, :report_category_id, :related_action_id], :unique=>true, :name=>:reports_unique   
    add_foreign_key :reports, :orders, on_delete: :cascade, on_update: :cascade
    add_foreign_key :reports, :report_categories, on_delete: :cascade, on_update: :cascade
    add_foreign_key :reports, :related_actions, on_delete: :cascade, on_update: :cascade              
  end
end
