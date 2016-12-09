class GenesGeneRelation < ActiveRecord::Base
  validates_presence_of :gene_id, :gene_relation_id    
  belongs_to :gene
  belongs_to :gene_relation
end
