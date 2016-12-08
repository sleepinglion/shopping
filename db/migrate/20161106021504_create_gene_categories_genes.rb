class CreateGeneCategoriesGenes < ActiveRecord::Migration
  def change
    create_table :gene_categories_genes do |t|
      t.references :gene_category, :gene
    end

    add_foreign_key :gene_categories_genes, :gene_categories, on_delete: :cascade, on_update: :cascade 
    add_foreign_key :gene_categories_genes, :genes, on_delete: :cascade, on_update: :cascade   
    add_index :gene_categories_genes, [:gene_category_id, :gene_id], :unique=>true
  end
end
