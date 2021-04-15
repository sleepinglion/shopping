class Order < ApplicationRecord
  after_initialize :default_values

  validates_presence_of :user_id,:total_price,:total_discount
  belongs_to :user, counter_cache: true
  has_many :accounts_orders, dependent: :destroy
  has_many :orders_products, dependent: :destroy
  has_many :products, :through => :orders_products
  has_many :accounts, :through => :accounts_orders
  accepts_nested_attributes_for :orders_products, :allow_destroy => true

  private

  def default_values
    self.last_transaction_date ||= Date.today
  end
end
