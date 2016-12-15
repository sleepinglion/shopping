class CreateGenesRelations < ActiveRecord::Migration
  def change
    create_table :genes_relations do |t|
      t.references :gene, :relation
    end

    add_foreign_key :genes_relations, :genes, on_delete: :cascade, on_update: :cascade 
    add_foreign_key :genes_relations, :relations, on_delete: :cascade, on_update: :cascade   
    add_index :genes_relations, [:gene_id, :relation_id], :unique=>true, :name=>:genes_relations_unique
  end
end
