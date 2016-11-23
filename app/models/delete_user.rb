class DeleteUser < ActiveRecord::Base
  validates_presence_of :username, :nickname, :email, :mobile_num, :nation_num 
end