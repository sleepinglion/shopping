class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :title, :null=>false, :limit=>60
      t.string :sub_title, :limit=>60
      t.text :description
      t.string :link
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
    
    add_index :genes, :title, :unique=>true, :name=>:genes_unique       
  end
end
