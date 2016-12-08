class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable, :timeoutable
  validates_uniqueness_of :email  
  validates_length_of :name, :within => 4..60
  validates_length_of :password, :within => 5..255 
  validates_presence_of :phone,  :birthday
  validates_presence_of :email, :name, :password, :password_confirmation, :on=>[:create]
  validates_confirmation_of :password
  has_many :shopping, :dependent=>:destroy
  has_many :order, :dependent=>:destroy
  has_many :user_login_log, :dependent=>:destroy
  
 # def password=(pass)
 #   require 'digest/sha1'
 #   @password=Digest::SHA1.hexdigest(pass);
 # end  
end