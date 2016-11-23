# encoding: utf-8

module DevicesHelper
  def push(notification_type,users,data)
    n = Rapns::Gcm::Notification.new
    n.app = Rapns::Gcm::App.find_by_name("com.seven.mym")
    n.registration_ids = users.select('registration_id').to_json
    n.data = {:type => type, :data => data.to_json }
    n.save!
    
    Rapns.push
  end
end
