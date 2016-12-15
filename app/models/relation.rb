class Relation < ActiveRecord::Base
  validates_presence_of :title
  has_many :genes_relation 
  has_many :gene, :through  => :genes_relation
end
