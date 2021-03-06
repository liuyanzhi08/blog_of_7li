class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin
  # attr_accessible :title, :body

  has_many :notices, :dependent => :destroy
  has_many :comments, :through => :notices
  has_many :microposts, :dependent => :destroy
  has_many :messages, :dependent => :destroy

  def admin?
    admin == true
  end
end
