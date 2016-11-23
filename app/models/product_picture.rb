class ProductPicture < ActiveRecord::Base
  validates_presence_of :product_id  
  belongs_to :product, :autosave => true, :counter_cache => true
  mount_uploader :photo, ProductPictureUploader
end
