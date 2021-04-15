class UsersController < ApplicationController
    load_and_authorize_resource except: [:new, :create, :complete, :service_agreement, :policy_privacy, :see_you_again, :check_email, :check_id, :validate_id, :select_service]

    def before_init
      super
      @page_itemtype='http://schema.org/AboutPage'
      @title= t(:menu_my_page)
    end

    # GET /users
    # GET /users.json
    def index
        @user = User.find(current_user)
        @controller_name = t(:menu_my_page)

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @users }
        end
    end

    def show
      @page_title=t(:menu_mypage)
    end

    def check_id
      @controller_name=t(:user_check_id_page)
      @birthday={}
    end

    def validate_id
      @birthday={}
      begin
        require 'exceptions/SLException'

        unless params[:name].present?
          raise SLException,'이름을 입력해주세요'
        end

        unless params[:birthday].present?
          raise SLException,'생년월일을 입력해주세요'
        end

        unless params[:barcode].present?
          raise SLException,'바코드를 입력해주세요'
        end

        @controller_name=t(:user_check_id_page)
        @birthday={day: params[:birthday]["(3i)"].to_i,month: params[:birthday]["(2i)"].to_i,year: params[:birthday]["(1i)"].to_i}
        s_date=Date.new(params[:birthday]["(1i)"].to_i,params[:birthday]["(2i)"].to_i,params[:birthday]["(3i)"].to_i)
        user=User.where(group_id:3,barcode:params[:barcode],name:params[:name],birthday:s_date).first

        respond_to do |format|
          if user.present?
            sign_in(:user, user)

            format.html { redirect_to report_path(current_user.reports[0]) }
            format.json { render json: user, status: :created, location: user }
          else
            @error=t(:no_exists_member)

            format.html { render :check_id }
            format.json { render json: @error, status: :unprocessable_entity }
          end
        end

        rescue SLException,ArgumentError=> e
          @error=e.message
          respond_to do |format|
            format.html { render :check_id }
            format.json { render json: @error, status: :unprocessable_entity }
          end
        end
    end

    # GET /users/new
    # GET /users/new.json
    def new
        @controller_name = t(:menu_new_user)
    end

    def check_email
        user_exists = User.where(login_id: params[:email]).exists?

        respond_to do |format|
            format.html { user_exists }
            format.json { render json: { exists: user_exists }}
        end
    end

    def complete; end
end
