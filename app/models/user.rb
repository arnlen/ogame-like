# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#  username        :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :username
  
  has_secure_password
  
  validates :username, :email, :password, :password_confirmation, presence: true
  
  before_save {self.email.downcase}
  before_save :create_remember_token
  
  has_many :planets
  
  private
  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end
  		
end
