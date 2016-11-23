class Shipping < ActiveRecord::Base
  validates_presence_of :name,:email,:zip_code,:address_default,:address_detail
  belongs_to :user
  belongs_to :order
end
