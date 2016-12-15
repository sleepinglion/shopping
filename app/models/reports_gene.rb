class ReportsGene < ActiveRecord::Base
  validates_presence_of :report_id, :gene_id, :genotype  
  belongs_to :report
  belongs_to :gene
end
