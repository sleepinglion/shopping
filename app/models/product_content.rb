class ProductContent < ApplicationRecord
  belongs_to :product, autosave: true, counter_cache: true
end
