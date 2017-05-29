class User < ApplicationRecord
  has_one :laboratory
  has_one :request, dependent: :destroy
  
  before_save { self.email = email.downcase }
  
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create}, uniqueness: {case_sensitive: false}
  
  has_secure_password
end
