class CreateGeneRelations < ActiveRecord::Migration
  def change
    create_table :gene_relations do |t|
      t.string :title, :null=>false, :limit=>60
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
