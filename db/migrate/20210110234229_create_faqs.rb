class CreateFaqs < ActiveRecord::Migration[6.0]
  def change
    create_table :faq_categories do |t|
      t.string :title, null: false
      t.integer :order_no, null: false, default: 0
      t.integer :faqs_count, null: false, default: 0
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end

    create_table :faqs do |t|
      t.references :faq_category, null: false
      t.string :title, null: false
      t.integer :order_no, null: false, default: 0
      t.integer :count, default: 0, null: false
      t.boolean :enable, null: false, default: true
      t.timestamps null: false
    end

    create_table :faq_contents do |t|
      t.text :content, null: false
    end
  end
end
