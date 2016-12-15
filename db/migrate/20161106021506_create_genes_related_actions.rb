class CreateGenesRelatedActions < ActiveRecord::Migration
  def change
    create_table :genes_related_actions do |t|
      t.references :gene, :related_action
    end

    add_foreign_key :genes_related_actions, :genes, on_delete: :cascade, on_update: :cascade
    add_foreign_key :genes_related_actions, :related_actions, on_delete: :cascade, on_update: :cascade       
    add_index :genes_related_actions, [:gene_id, :related_action_id], :unique=>true
  end
end
