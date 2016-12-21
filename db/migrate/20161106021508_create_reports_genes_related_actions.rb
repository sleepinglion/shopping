class CreateReportsGenesRelatedActions < ActiveRecord::Migration
  def change
    create_table :reports_genes_related_actions do |t|
      t.references :report, :null=>false
      t.references :genes_related_action, :null=>false
      t.string :genotype, :null=>false, :limit=>2
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
     
    add_foreign_key :reports_genes_related_actions, :reports, on_delete: :cascade, on_update: :cascade
    add_foreign_key :reports_genes_related_actions, :genes_related_actions, on_delete: :cascade, on_update: :cascade
  end
end
