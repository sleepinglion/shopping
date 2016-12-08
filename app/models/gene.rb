class Gene < ActiveRecord::Base
  validates_presence_of :title,:sub_title,:description
  belongs_to :gene_category
end
