class Account < ApplicationRecord
  after_initialize :default_values
  belongs_to :account_category
  belongs_to :user, counter_cache: true
  has_many :accounts_orders, dependent: :destroy
  has_many :accounts_products, dependent: :destroy
  has_many :orders, :through => :accounts_orders
  has_many :products, :through => :accounts_products
  private

  def default_values
    self.transaction_date ||= Date.today
  end
end
