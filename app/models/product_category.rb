class ProductCategory < ApplicationRecord
  validates_presence_of :title
  has_many :products, dependent: :destroy
end
