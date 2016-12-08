class CreateGeneCategories < ActiveRecord::Migration
  def change
    create_table :gene_categories do |t|
      t.string :title, :null=>false, :limit=>60
      t.string :sub_title, :null=>false, :limit=>60
      t.text :tip, :null=>false   
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
