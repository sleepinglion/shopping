class Gene < ActiveRecord::Base
  validates_presence_of :title,:sub_title,:description
  has_many :genes_related_action
  has_many :genes_relation
  has_many :related_action, :through  => :genes_related_action, :autosave => true
  has_many :relation, :through  => :genes_relation, :autosave => true
end
