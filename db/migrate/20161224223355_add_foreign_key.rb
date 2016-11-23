# encoding: utf-8

class AddForeignKey< ActiveRecord::Migration
  def change
    #ActiveRecord::Base.connection.execute "ALTER TABLE `ci_tables` change id varchar(40)"
=begin     
          # 광고
    ActiveRecord::Base.connection.execute "ALTER TABLE `ads` ADD FOREIGN KEY ( `ad_type_id` ) REFERENCES `ad_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ads` ADD FOREIGN KEY ( `admin_id` ) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"                
    ActiveRecord::Base.connection.execute "ALTER TABLE `ads` ADD FOREIGN KEY ( `sponsor_id` ) REFERENCES `sponsors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ads` ADD FOREIGN KEY ( `agent_id` ) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"     
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_files` ADD FOREIGN KEY ( `ad_id` ) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_schedules` ADD FOREIGN KEY ( `ad_id` ) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_states` ADD FOREIGN KEY ( `ad_id` ) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
    ActiveRecord::Base.connection.execute "ALTER TABLE `ad_options` ADD FOREIGN KEY ( `ad_id` ) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE ;"
=end                    
  end
end 
