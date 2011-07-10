class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :gender, :zip_code, :date_of_birth, :ethnicity
  
  validates_format_of :zip_code, :with => /(^\d{5}$)/, :message => 'is an invalid zip code' 
  
  validates_inclusion_of :date_of_birth, :in => Date.new(1900)..Time.now.years_ago(18).to_date,
    :message => 'You must be 18 years or older to signup'
    
  has_many :favorites
end
