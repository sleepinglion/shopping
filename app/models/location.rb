class Location < ActiveRecord::Base
  validates_presence_of :title, :description, :address, :lat, :lng, :marker_lat, :marker_lng
end
