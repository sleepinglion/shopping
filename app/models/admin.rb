class Admin < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable, :timeoutable
  validates_length_of :login_id, :within => 4..40  
  validates_length_of :password, :within => 5..255 
  mount_uploader :photo, AdminUploader
  
  has_many :roles_admin
  has_many :role, :through=> :roles_admin
  
  def role?(role)
    return !!self.role.find_by_title(role)
  end
end