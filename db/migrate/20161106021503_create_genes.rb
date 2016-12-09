class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :title, :null=>false, :limit=>60
      t.string :sub_title, :null=>false, :limit=>60
      t.text :description, :null=>false
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
