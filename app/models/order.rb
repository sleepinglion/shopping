class Order < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :payment
  belongs_to :shipping
  belongs_to :user
  has_one :guest
  has_many :product, :through => :orders_product
end
