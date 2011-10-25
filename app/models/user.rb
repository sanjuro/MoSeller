#
# Table name: users
#
#  email      :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # To facilitate username or email login
  attr_accessor :login
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :name, :username, :email, :password, :password_confirmation, 
                  :remember_me, :cap_left, :cap_limit
  
  validates :name,  :presence => true
  validates :email,  :presence => true
  
  belongs_to :client
  
  has_many :orders
  has_many :invoices
  
  scope :recent_by_sign_in, order("user.last_sign_in_at")   
  
  def self.current
    Thread.current[:user]
  end
  
  def self.current=(user)
    Thread.current[:user] = user
  end
  
  # Overrides the devise method find_for_authentication
  # Allow users to Sign In using their username or email address
  def self.find_for_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
  end
  
end