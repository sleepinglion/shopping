class GeneCategoriesGene < ActiveRecord::Base
  validates_presence_of :gene_category_id,:gene_id  
  belongs_to :gene_category
  belongs_to :gene
end
