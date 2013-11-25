class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :confirmed_at
  # attr_accessible :title, :body

  def self.find_for_google_oauth(provider, uid, email, signed_in_resource=nil)
	  user = User.where(:provider => provider, :uid => uid).first
	  unless user
	    user = User.create(  provider:provider,
	                         uid:uid,
	                         email:email,
	                         confirmed_at: Time.now,
	                         password:Devise.friendly_token[0,20]
	                         )
	    #name:auth.extra.raw_info.name,
	  end
  user
  end

end
