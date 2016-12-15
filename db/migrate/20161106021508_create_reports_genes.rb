class CreateReportsGenes < ActiveRecord::Migration
  def change
    create_table :reports_genes do |t|
      t.references :report, :null=>false
      t.references :gene, :null=>false
      t.string :genotype, :null=>false
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
    
    add_index :reports_genes, [:report_id, :gene_id], :unique=>true, :name=>:reports_genes_unique   
    add_foreign_key :reports_genes, :reports, on_delete: :cascade, on_update: :cascade
    add_foreign_key :reports_genes, :genes, on_delete: :cascade, on_update: :cascade
  end
end
