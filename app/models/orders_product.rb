class OrdersProduct < ActiveRecord::Base
  validates_presence_of :order_id, :product_id
  validates :order_id, :numericality => { :only_integer => true }
  validates :product_id, :numericality => { :only_integer => true }
  belongs_to :order
  belongs_to :product
end
