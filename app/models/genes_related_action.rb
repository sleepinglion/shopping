class GenesRelatedAction < ActiveRecord::Base
  validates_presence_of :gene_id, :related_action_id
  belongs_to :gene
  belongs_to :related_action
end
