class Payment < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :title, :minimum => 4, :maximum => 60
  has_many :order
end
