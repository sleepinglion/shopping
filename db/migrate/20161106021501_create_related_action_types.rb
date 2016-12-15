class CreateRelatedActionTypes < ActiveRecord::Migration
  def change
    create_table :related_action_types do |t|
      t.string :title, :null=>false, :limit=>60
      t.boolean :enable, :null=>false, :default=>false
      t.timestamps
    end
  end
end
