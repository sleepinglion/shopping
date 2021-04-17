class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :name, limit: 60, null: false
      t.string :title, limit: 60, null: false
      t.string :phone, limit: 60, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end

    create_table :contact_contents do |t|
      t.text :content, null: false
    end
  end
end
