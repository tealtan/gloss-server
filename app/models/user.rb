class User < ActiveRecord::Base
  validates_uniqueness_of :username, :case_sensitive => false
  validates_presence_of :username
  before_save :ensure_authentication_token
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
end
