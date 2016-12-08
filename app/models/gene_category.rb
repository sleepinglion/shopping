class GeneCategory < ActiveRecord::Base
  validates_presence_of :title,:sub_title,:tip
  has_many :gene
end
