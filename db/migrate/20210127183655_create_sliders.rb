class CreateSliders < ActiveRecord::Migration[6.0]
  def change
    create_table :sliders do |t|
      t.string :title, :null=>false
      t.string :description, :null=>false
      t.string :link
      t.string :position_x_type, :null=>false, :default=>'top'
      t.string :position_y_type, :null=>false, :default=>'left'
      t.integer :position_x, :null=>false, :default=>0
      t.integer :position_y, :null=>false, :default=>0
      t.string :picture, :null=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps null: false
    end
  end
end
