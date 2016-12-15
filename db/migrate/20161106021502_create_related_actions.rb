class CreateRelatedActions < ActiveRecord::Migration
  def change
    create_table :related_actions do |t|
#     t.references :related_action_type, :null=>false     
      t.string :title, :null=>false, :limit=>60
      t.string :sub_title, :null=>false, :limit=>60
#     t.decimal :average, :precision => 10, :scale => 5
#     t.decimal :gene_percentage, :precision => 10, :scale => 5
#     t.decimal :envi_percentage, :precision => 10, :scale => 5      
      t.text :tip, :null=>false
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
    
#    add_foreign_key :actions, :action_types, on_delete: :cascade, on_update: :cascade      
  end
end
