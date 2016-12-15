class GenesRelation < ActiveRecord::Base
  validates_presence_of :gene_id, :relation_id    
  belongs_to :gene
  belongs_to :relation
end
