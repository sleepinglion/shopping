class Slider < ApplicationRecord
  validates_presence_of :title, :description
  mount_uploader :picture, SliderUploader
end
