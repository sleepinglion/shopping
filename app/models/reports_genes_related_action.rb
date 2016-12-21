class ReportsGenesRelatedAction < ActiveRecord::Base
  validates_presence_of :report_id, :genes_related_action_id, :genotype  
  belongs_to :report
  belongs_to :genes_related_action
  has_many :genes, :through  => :genes_related_action
end
