class Adminuser < ApplicationRecord
  # before store on db validate defined data accordingly
  before_save {self.email = self.email.downcase}
  validates :username, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:{maximum: 255},
            format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  # generate password digest using Bcrypt::Engine and authenticate
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
end
