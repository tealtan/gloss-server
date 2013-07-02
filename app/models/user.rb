class User < ActiveRecord::Base
  before_create :ensure_unique_username
  before_save :ensure_authentication_token
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  def ensure_unique_username
    if self.username.blank? || User.where(username: self.username).count > 0
      username_part = self.email.split("@").first
      new_username = username_part.dup
      num = 2
      while(User.where(username: new_username).count > 0)
        new_username = "#{username_part}#{num}"
        num += 1
      end
      self.username = new_username
    end
  end
end
