class User < ActiveRecord::Base
  include OmniauthAttributesConcern
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates_presence_of :name, :email, :on => :create
  validates_length_of :email, :within => 4..255
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_length_of :password, :within => 4..255, :allow_blank => true
  has_many :orders, dependent: :destroy
  has_many :accounts, dependent: :nullify
  has_one :user_picture, dependent: :destroy

  def self.create_from_omniauth(params)
    self.__send__(params.provider, params)
  end
end

