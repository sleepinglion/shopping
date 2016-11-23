class Product < ActiveRecord::Base
  validates_presence_of :title,:description
  validates_numericality_of :price, :shipping_price
  has_many :product_picture, :dependent=>:destroy
  belongs_to :order 
end
