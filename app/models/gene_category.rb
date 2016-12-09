class GeneCategory < ActiveRecord::Base
  validates_presence_of :title,:sub_title,:tip
  has_many :gene_categories_gene  
  has_many :genes, :through  => :gene_categories_gene, :autosave => true
end
