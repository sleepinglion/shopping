class CreateLocation < ActiveRecord::Migration[6.0]
  def change
    create_table :location do |t|
      t.string :title,:limit=>60,:null=>false
      t.string :description, :null=>false
      t.string :address, :null=>false
      t.float :lat, :null=>false
      t.float :lng, :null=>false
      t.float :marker_lat, :null=>false
      t.float :marker_lng, :null=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps null: false
    end
  end
end
