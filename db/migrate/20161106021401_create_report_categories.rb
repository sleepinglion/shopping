class CreateReportCategories < ActiveRecord::Migration
  def change
    create_table :report_categories do |t|
      t.string :title, :null=>false, :limit=>60
      t.string :sub_title, :null=>false, :limit=>60
      t.string :color, :null=>false, :limit=>20      
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
