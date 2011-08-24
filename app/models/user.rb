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
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  validates :name,  :presence => true
  
  belongs_to :client
end
