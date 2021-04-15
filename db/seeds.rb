# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

AuthenticationProvider.create!(name: 'facebook')
AuthenticationProvider.create!(name: 'twitter')
AuthenticationProvider.create!(name: 'google')

Admin.create!(:id => 1, :email => 'admin@a.com', :name => '잠자는사자', :password => '123456', :password_confirmation => '123456', admin_picture_attributes: { picture: File.open(Rails.root.join("app", "assets", "images", "dog.png")) })
#Admin.create!(:id=>2,:branch_id=>2,:email => '',:name=>'매점 관리자',:password => '123456', :password_confirmation => '123456')
#Admin.create!(:id=>3,:branch_id=>3,:email => '',:name=>'매점 관리자',:password => '123456', :password_confirmation => '123456')

Role.create!(:id => 1, :title => 'super administrator')
#Role.create!(:id=>2,:title=>'administrator')
#Role.create!(:id=>3,:title=>'operator')
#Role.create!(:id=>4,:title=>'sub operator')
#Role.create!(:id=>5,:title=>'reader')

RolesAdmin.create!(:role_id => 1, :admin_id => 1)

Intro.create!(id: 1, title: '좋은회사입니다', content: '너무나 좋은 회사입니다. <br />지금 바로 구매하세요!!')
Location.create!(id: 1, title: '오시는길', description: '오시는 방법', address: '경기도 수원시 장안구', lat: 37.304749, lng: 127.003248, marker_lat: 37.304749, marker_lng: 127.003248)

Notice.create!(id: 1, admin_id: 1, title: '공지사항1입니다', notice_content_attributes: { content: '공지사항1입니다' })
Notice.create!(id: 2, admin_id: 1, title: '공지사항2입니다', notice_content_attributes: { content: '공지사항2입니다' })
Notice.create!(id: 3, admin_id: 1, title: '공지사항3입니다', notice_content_attributes: { content: '공지사항3입니다' })
Notice.create!(id: 4, admin_id: 1, title: '공지사항4입니다', notice_content_attributes: { content: '공지사항4입니다' })
Notice.create!(id: 5, admin_id: 1, title: '공지사항5입니다', notice_content_attributes: { content: '공지사항5입니다' })
Notice.create!(id: 6, admin_id: 1, title: '공지사항6입니다', notice_content_attributes: { content: '공지사항6입니다' })
Notice.create!(id: 7, admin_id: 1, title: '공지사항7입니다', notice_content_attributes: { content: '공지사항7입니다' })
Notice.create!(id: 8, admin_id: 1, title: '공지사항8입니다', notice_content_attributes: { content: '공지사항8입니다' })
Notice.create!(id: 9, admin_id: 1, title: '공지사항9입니다', notice_content_attributes: { content: '공지사항9입니다' })
Notice.create!(id: 10, admin_id: 1, title: '공지사항10입니다', notice_content_attributes: { content: '공지사항10입니다' })
Notice.create!(id: 11, admin_id: 1, title: '공지사항11입니다', notice_content_attributes: { content: '공지사항11입니다' })
Notice.create!(id: 12, admin_id: 1, title: '공지사항12입니다', notice_content_attributes: { content: '공지사항12입니다' })

ProductCategory.create!(id: 1, title: '타입1', description: '타입1 마스크 입니다', bg_color: '#fff', enable: true)
ProductCategory.create!(id: 2, title: '타입2', description: '타입1 마스크 입니다', bg_color: '#eee', enable: true)
ProductCategory.create!(id: 3, title: '타입3', description: '타입1 마스크 입니다', bg_color: '#fff', enable: true)
ProductCategory.create!(id: 4, title: '타입4', description: '타입1 마스크 입니다', bg_color: '#eee', enable: true)

Product.create!(id: 1, product_category_id: 1, title: '타입1 제품1', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 2, product_category_id: 1, title: '타입1 제품2', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 3, product_category_id: 1, title: '타입1 제품3', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 4, product_category_id: 1, title: '타입1 제품1', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 5, product_category_id: 1, title: '타입1 제품2', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])

Product.create!(id: 7, product_category_id: 2, title: '타입2 제품3', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 8, product_category_id: 2, title: '타입2 제품1', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 9, product_category_id: 2, title: '타입2 제품2', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 10, product_category_id: 2, title: '타입2 제품1', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 11, product_category_id: 2, title: '타입2 제품2', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])

Product.create!(id: 12, product_category_id: 3, title: '타입3 제품1', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 13, product_category_id: 3, title: '타입3 제품2', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 14, product_category_id: 3, title: '타입3 제품3', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])

Product.create!(id: 15, product_category_id: 4, title: '타입4 제품1', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 16, product_category_id: 4, title: '타입4 제품2', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])
Product.create!(id: 17, product_category_id: 4, title: '타입4 제품3', description: '좋은 마스크입니다', price: 2000, enable: true, product_pictures_attributes: [{ picture: File.open(Rails.root.join("app", "assets", "images", "product.jpg")) },{ picture: File.open(Rails.root.join("app", "assets", "images", "product2.jpg")),caption: '제품의 2번째 모습' },{ picture: File.open(Rails.root.join("app", "assets", "images", "product3.jpg")) }])

Payment.create!(:id=>1,:title=>'현금')
Payment.create!(:id=>2,:title=>'카드')
Payment.create!(:id=>3,:title=>'포인트')
Payment.create!(:id=>4,:title=>'추후청구')
Payment.create!(:id=>5,:title=>'핸드폰')
Payment.create!(:id=>6,:title=>'계좌이체')
Payment.create!(:id=>7,:title=>'가상계좌')
Payment.create!(:id=>8,:title=>'무통장입금')

AccountCategory.create!(id: 1, title: '구입', enable: true)
AccountCategory.create!(id: 2, title: '수정', enable: true)
AccountCategory.create!(id: 3, title: '환불', enable: true)
AccountCategory.create!(id: 4, title: '포인트충전', enable: true)
AccountCategory.create!(id: 5, title: '포인트환불', enable: true)

FaqCategory.create!(id: 1, title: '하는방법 문의1')
FaqCategory.create!(id: 2, title: '하는방법 문의2')

Faq.create!(:id => 1, :faq_category_id => 1, :title => '어떻게 하는건가요?1', faq_content_attributes: { content: '이렇게 하면 됩니다1-1' })
Faq.create!(:id => 2, :faq_category_id => 1, :title => '어떻게 하는건가요?2', faq_content_attributes: { content: '이렇게 하면 됩니다1-2' })
Faq.create!(:id => 3, :faq_category_id => 1, :title => '어떻게 하는건가요?3', faq_content_attributes: { content: '이렇게 하면 됩니다1-3' })
Faq.create!(:id => 4, :faq_category_id => 2, :title => '어떻게 하는건가요?2-1', faq_content_attributes: { content: '이렇게 하면 됩니다2-1' })
Faq.create!(:id => 5, :faq_category_id => 2, :title => '어떻게 하는건가요?2-2', faq_content_attributes: { content: '이렇게 하면 됩니다2-2' })

Slider.create!(:title => '마스크1', :description => '마스크1', :link => '',:position_x=>'100',:position_y=>'100', :picture => File.open(Rails.root.join("app", "assets", "images", "1.jpg")))
Slider.create!(:title => '마스크2', :description => '마스크1', :link => '',:position_x=>'100',:position_y=>'100', :picture => File.open(Rails.root.join("app", "assets", "images", "2.jpg")))
Slider.create!(:title => '마스크2', :description => '마스크1', :link => '',:position_x=>'100',:position_y=>'100', :picture => File.open(Rails.root.join("app", "assets", "images", "3.jpg")))
Slider.create!(:title => '마스크2', :description => '마스크1', :link => '',:position_x=>'100',:position_y=>'100',:picture => File.open(Rails.root.join("app", "assets", "images", "4.jpg")))


User.create!(:id=>1, :name=>'관리자',:email=>'admin@sleepinglion.pe.kr', :password => '123456', :password_confirmation => '123456');
User.create!(:id=>2, :name=>'테스트', :email=>'admin@a.com', :password => '123456', :password_confirmation => '123456');

