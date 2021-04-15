class Product < ApplicationRecord
  validates_presence_of :title
  belongs_to :product_category, counter_cache: true
  has_many :orders, :through => :orders_products
  has_one :product_discount, dependent: :destroy
  has_one :product_content, dependent: :destroy
  has_many :product_pictures, dependent: :destroy
  accepts_nested_attributes_for :product_content, :allow_destroy => true, reject_if: proc { |attributes| attributes['content'].blank? }
  accepts_nested_attributes_for :product_pictures, :allow_destroy => true, reject_if: proc { |attributes| attributes['picture'].blank? }
end
