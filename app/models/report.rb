class Report < ActiveRecord::Base
  validates_presence_of :order_id,:report_category_id,:gene_category_id
  belongs_to :order
  belongs_to :report_category
  belongs_to :gene_category
  has_many :gene
end
