class CreateGenesGeneRelations < ActiveRecord::Migration
  def change
    create_table :genes_gene_relations do |t|
      t.references :gene, :gene_relation
    end

    add_foreign_key :genes_gene_relations, :genes, on_delete: :cascade, on_update: :cascade 
    add_foreign_key :genes_gene_relations, :gene_relations, on_delete: :cascade, on_update: :cascade   
    add_index :genes_gene_relations, [:gene_id, :gene_relation_id], :unique=>true, :name=>:genes_gene_relations_unique
  end
end
