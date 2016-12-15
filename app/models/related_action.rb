class RelatedAction < ActiveRecord::Base
  validates_presence_of :title,:sub_title,:tip
  has_many :genes_related_action  
  has_many :genes, :through  => :genes_related_action, :autosave => true
end
