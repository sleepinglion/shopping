class Gene < ActiveRecord::Base
  validates_presence_of :title,:sub_title,:description
  has_many :gene_categories_gene
  has_many :genes_gene_relation  
  has_many :gene_category, :through  => :gene_categories_gene, :autosave => true
  has_many :gene_relation, :through  => :genes_gene_relation, :autosave => true
end
