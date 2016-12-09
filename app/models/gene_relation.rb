class GeneRelation < ActiveRecord::Base
  validates_presence_of :title
  has_many :genes_gene_relation 
  has_many :gene, :through  => :genes_gene_relation
end
