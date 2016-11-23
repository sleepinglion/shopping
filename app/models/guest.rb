class Guest < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :order
end
