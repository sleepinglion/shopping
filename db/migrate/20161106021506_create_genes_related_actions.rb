class CreateGenesRelatedActions < ActiveRecord::Migration
  def change
    create_table :genes_related_actions do |t|
      t.references :gene, :related_action
      t.string :position, :null=>false, :limit=>60
      t.string :factor, :null=>false, :limit=>1
      t.decimal :korean_rate, :precision => 10, :scale => 5
      t.string :paper, :limit=>150 
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps         
    end

    add_foreign_key :genes_related_actions, :genes, on_delete: :cascade, on_update: :cascade
    add_foreign_key :genes_related_actions, :related_actions, on_delete: :cascade, on_update: :cascade       
    add_index :genes_related_actions, [:gene_id,:related_action_id,:position], :unique=>true, :name=>:genes_related_actions_unique 
  end
end
