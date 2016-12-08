Admin.create(:id=>1,:login_id=>'toughjjh',:email => 'toughjjh@gmail.com',:nickname=>'잠자는-사자',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>2,:login_id=>'admin',:email => 'jpark@myseven.co.kr',:nickname=>'Jon Doe',:password => '111111', :password_confirmation => '111111',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>3,:parent_id=>2,:login_id=>'admin2',:email => 'jpark1@myseven.co.kr',:nickname=>'Jon Doe1',:password => '111111', :password_confirmation => '111111',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>4,:parent_id=>2,:login_id=>'operator',:email => 'jpark2@myseven.co.kr',:nickname=>'Operator',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>5,:parent_id=>2,:login_id=>'sub_operator',:email => 'jpark5@myseven.co.kr',:nickname=>'SubOperator',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>6,:parent_id=>2,:login_id=>'reader',:email => 'jpark4@myseven.co.kr',:nickname=>'Reader',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>7,:parent_id=>2,:login_id=>'sponsor',:email => 'jpark6@myseven.co.kr',:nickname=>'Sponsor',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>8,:parent_id=>2,:login_id=>'ad_manager',:email => 'jpark4@mysrheven.co.kr',:nickname=>'ad_manager',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>9,:parent_id=>2,:login_id=>'store_manager',:email => 'jpark6@myserheven.co.kr',:nickname=>'store_manager',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))
Admin.create(:id=>10,:parent_id=>2,:login_id=>'cs_manager',:email => 'jpark6@myserhevwegen.co.kr',:nickname=>'cs',:password => '123456', :password_confirmation => '123456',:photo=>File.open(Rails.root.join("app", "assets", "images", "dog.png")))

Role.create(:id=>1,:title=>'administrator')
Role.create(:id=>2,:title=>'operator')
Role.create(:id=>3,:title=>'store_manager')
Role.create(:id=>4,:title=>'cs_manager')
Role.create(:id=>5,:title=>'reader')

RolesAdmin.create(:role_id=>1,:admin_id=>1)
RolesAdmin.create(:role_id=>1,:admin_id=>2)
RolesAdmin.create(:role_id=>1,:admin_id=>3)
RolesAdmin.create(:role_id=>2,:admin_id=>4)
RolesAdmin.create(:role_id=>3,:admin_id=>5)
RolesAdmin.create(:role_id=>4,:admin_id=>6)
RolesAdmin.create(:role_id=>5,:admin_id=>7)

User.create(:id=>1,:name=>'user1',:email => 'toughjjh@gmail.com',:password => '123456', :password_confirmation => '123456', :birthday=>'2016-07-03', :phone=>'010-4141-3726',:sex=>1,:height=>180,:weight=>80,:enable=>true)
User.create(:id=>2,:name=>'user2',:email => 'toughjjh1@gmail.com',:password => '123456', :password_confirmation => '123456', :birthday=>'2016-07-03', :phone=>'010-4141-3726',:sex=>1,:enable=>true)
User.create(:id=>3,:name=>'user3',:email => 'toughjjh2@gmail.com',:password => '123456', :password_confirmation => '123456', :birthday=>'2016-07-03', :phone=>'010-4141-3726',:height=>160,:weight=>55,:enable=>true)
User.create(:id=>4,:name=>'user4',:email => 'toughjjh3@gmail.com',:password => '123456', :password_confirmation => '123456', :birthday=>'2016-07-03', :phone=>'010-4141-3726',:sex=>1,:enable=>true)
User.create(:id=>5,:name=>'user5',:email => 'toughjjh4@gmail.com',:password => '123456', :password_confirmation => '123456', :birthday=>'2016-07-03', :phone=>'010-4141-3726',:enable=>true)
User.create(:id=>6,:name=>'user6',:email => 'toughjjh5@gmail.com',:password => '123456', :password_confirmation => '123456', :birthday=>'2016-07-03', :phone=>'010-4141-3726',:height=>170,:weight=>65,:enable=>true)

Payment.create(:title=>'카드결제',:enable=>true)
Payment.create(:title=>'핸드폰결제',:enable=>false)
Payment.create(:title=>'계좌이체',:enable=>false)
Payment.create(:title=>'가상계좌',:enable=>false)
Payment.create(:title=>'무통장입금',:enable=>false)

Product.create(:title=>'Check Service',:description=>'Good Service',:price=>150000,:shipping_price=>3000,:enable=>true);

Shipping.create(:id=>1,:name=>'정종호',:zip_code=>'123535',:address_default=>'123521',:address_detail=>'1235235',:phone=>'2351235',:email=>'123512@tgaweg.net',:enable=>true);
Order.create(:id=>1,:user_id=>1,:shipping_id=>1,:payment_id=>1,:total_price=>20000,:enable=>true);

ReportCategory.create(:id=>1,:title=>'중점관리');
ReportCategory.create(:id=>2,:title=>'관리');
ReportCategory.create(:id=>3,:title=>'양호');

GeneCategory.create(:id=>1,:title=>'색소침착',:sub_title=>'pigmentation',:enable=>true,:tip=>'햇빛이 강한날에 야외활동을 오래한다면 누구나 피부에 색소침착이 생길 수 있으나');
GeneCategory.create(:id=>2,:title=>'혈당',:sub_title=>'blood sugar',:enable=>true,:tip=>'햇빛이 강한날에 야외활동을 오래한다면 누구나 피부에 색소침착이 생길 수 있으나');
GeneCategory.create(:id=>3,:title=>'체질량지수',:sub_title=>'BMI',:enable=>true,:tip=>'햇빛이 강한날에 야외활동을 오래한다면 누구나 피부에 색소침착이 생길 수 있으나');
GeneCategory.create(:id=>4,:title=>'혈압',:sub_title=>'blood pressure',:enable=>true,:tip=>'햇빛이 강한날에 야외활동을 오래한다면 누구나 피부에 색소침착이 생길 수 있으나');
GeneCategory.create(:id=>5,:title=>'탈모',:sub_title=>'hair loss',:enable=>true,:tip=>'햇빛이 강한날에 야외활동을 오래한다면 누구나 피부에 색소침착이 생길 수 있으나');
GeneCategory.create(:id=>6,:title=>'모발굵기',:sub_title=>'hair thickness',:enable=>true,:tip=>'햇빛이 강한날에 야외활동을 오래한다면 누구나 피부에 색소침착이 생길 수 있으나');
GeneCategory.create(:id=>7,:title=>'피부노화',:sub_title=>'skin aging',:enable=>true,:tip=>'햇빛이 강한날에 야외활동을 오래한다면 누구나 피부에 색소침착이 생길 수 있으나');
GeneCategory.create(:id=>8,:title=>'피부탄력',:sub_title=>'elasticity of skin',:enable=>true,:tip=>'햇빛이 강한날에 야외활동을 오래한다면 누구나 피부에 색소침착이 생길 수 있으나');
GeneCategory.create(:id=>9,:title=>'중성지방농도',:sub_title=>'triglycerides',:enable=>true,:tip=>'햇빛이 강한날에 야외활동을 오래한다면 누구나 피부에 색소침착이 생길 수 있으나');
GeneCategory.create(:id=>10,:title=>'콜레스테롤',:sub_title=>'cholesterol',:enable=>true,:tip=>'햇빛이 강한날에 야외활동을 오래한다면 누구나 피부에 색소침착이 생길 수 있으나');
GeneCategory.create(:id=>11,:title=>'비타민 C 농도',:sub_title=>'vitamin C',:enable=>true,:tip=>'햇빛이 강한날에 야외활동을 오래한다면 누구나 피부에 색소침착이 생길 수 있으나');

Report.create(:order_id=>1,:report_category_id=>1,:gene_category_id=>1);
Report.create(:order_id=>1,:report_category_id=>1,:gene_category_id=>2);
Report.create(:order_id=>1,:report_category_id=>1,:gene_category_id=>3);

Report.create(:order_id=>1,:report_category_id=>2,:gene_category_id=>4);
Report.create(:order_id=>1,:report_category_id=>2,:gene_category_id=>5);
Report.create(:order_id=>1,:report_category_id=>2,:gene_category_id=>6);

Report.create(:order_id=>1,:report_category_id=>3,:gene_category_id=>7);
Report.create(:order_id=>1,:report_category_id=>3,:gene_category_id=>8);
Report.create(:order_id=>1,:report_category_id=>3,:gene_category_id=>9);
Report.create(:order_id=>1,:report_category_id=>3,:gene_category_id=>10);
Report.create(:order_id=>1,:report_category_id=>3,:gene_category_id=>11);

