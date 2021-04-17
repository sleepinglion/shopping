crumb :root do
  link t(:home), root_path
end

crumb :intro_company do
   link t(:menu_intro), intro_path
end

crumb :intro do
   link t('activerecord.models.intro'),intro_path
   parent :intro_company
end

crumb :location do
   link t('activerecord.models.location'),location_path
   parent :intro_company
end

crumb :info_menu do
   link t(:menu_info), ''
end

crumb :boards do
   link t('activerecord.models.board'), boards_path
   parent :info_menu
end

crumb :notices do
   link t('activerecord.models.notice'), notices_path
   parent :info_menu
end

crumb :info do
   link t(:menu_info), info_path
   parent :info_menu
end

crumb :supports do
   link t(:menu_support), ''
end

crumb :faqs do
   link t('activerecord.models.faq'), faqs_path
   parent :supports
end

crumb :contacts do
   link t('activerecord.models.contact'), contacts_path
   parent :supports
end

crumb :contact_complete do
   link t(:contact_complete), complete_contacts_path
   parent :contacts
end

crumb :products do
   link t(:menu_product),products_path
end

crumb :mypage do
   link t(:menu_mypage),users_path
end

crumb :product do |product|
   link product.title, product_path(product)
   parent :products
end


crumb :notice do |notice|
   link notice.title, notice_path(notice)
   parent :notices
end
